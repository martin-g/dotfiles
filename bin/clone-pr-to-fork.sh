#!/bin/bash

# Script to clone a pull request from a GitHub repository to a fork
# Usage: ./clone-pr-to-fork.sh <original_repo_url>/pull/<pr_number>

# Make sure you have forked the repository before running this script !

set -eu

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
log_info() {
    >&2 echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    >&2 echo -e "${RED}[ERROR]${NC} $1"
}

log_warning() {
    >&2 echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check if required arguments are provided
if [ $# -ne 2 ]; then
    log_error "Usage: $0 fork-owner <original_repo_url>/pull/<pr_number>"
    log_error "Example: $0 github-id https://github.com/owner/repo/pull/123"
    exit 1
fi

FORK_OWNER="$1"
ORIGINAL_REPO_URL="$2"
REPO_NAME=$(echo $ORIGINAL_REPO_URL | cut -d'/' -f5)
PR_NUMBER=$(echo $ORIGINAL_REPO_URL | cut -d'/' -f7)
FORK_REPO_URL="git@github.com:${FORK_OWNER}/${REPO_NAME}.git"

# Extract owner/repo from URLs
extract_repo_info() {
    local url="$1"
    # Remove .git suffix if present
    url="${url%.git}"
    # Extract owner/repo from various GitHub URL formats
    if [[ "$url" =~ github\.com[:/]([^/]+)/([^/]+) ]]; then
        echo "${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"
    else
        log_error "Invalid GitHub URL format: $url"
        exit 1
    fi
}

ORIGINAL_REPO=$(extract_repo_info "$ORIGINAL_REPO_URL")
FORK_REPO=${FORK_OWNER}/${REPO_NAME}

log_info "Original repository: $ORIGINAL_REPO"
log_info "Fork repository: $FORK_REPO"
log_info "Pull request number: $PR_NUMBER"

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    log_error "GitHub CLI (gh) is not installed. Please install it from https://cli.github.com/"
    exit 1
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    log_error "'jq' is not installed. Please install it from https://jqlang.org/"
    exit 1
fi

# Check if gh is authenticated
if ! gh auth status &> /dev/null; then
    log_error "GitHub CLI is not authenticated. Please run 'gh auth login'"
    exit 1
fi

# Get PR details
log_info "Fetching pull request details..."
PR_DATA=$(gh pr view "$PR_NUMBER" --repo "$ORIGINAL_REPO" --json headRefName,headRepository,headRepositoryOwner,title,body,baseRefName)

if [ $? -ne 0 ]; then
    log_error "Failed to fetch pull request details. Please check the PR number and repository."
    exit 1
fi

# Extract PR information
PR_BRANCH=$(echo "$PR_DATA" | jq -r '.headRefName')
PR_BASE_BRANCH=$(echo "$PR_DATA" | jq -r '.baseRefName')
PR_TITLE=$(echo "$PR_DATA" | jq -r '.title')
PR_BODY=$(echo "$PR_DATA" | jq -r '.body')
PR_HEAD_REPO=$(echo "$PR_DATA" | jq -r '.headRepositoryOwner.login + "/" + .headRepository.name')

log_info "PR Branch: $PR_BRANCH"
log_info "PR Base Branch: $PR_BASE_BRANCH"
log_info "PR Title: $PR_TITLE"

# Create a temporary directory for cloning
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT
trap "gh auth switch --user martin-g" EXIT

gh auth switch --user ${FORK_OWNER}

gh repo sync ${FORK_REPO}

log_info "Cloning fork repository..."
cd "$TEMP_DIR"
gh repo clone ${FORK_REPO_URL} ${REPO_NAME}
cd ${REPO_NAME}

# Add original repository as upstream remote
log_info "Adding original repository as upstream remote..."
#git remote add upstream "$ORIGINAL_REPO_URL"
git fetch upstream

# Fetch the PR branch
log_info "Fetching pull request branch..."
git fetch upstream "pull/$PR_NUMBER/head:pr-$PR_NUMBER"

# Create a new branch in the fork based on the PR
NEW_BRANCH="pr-$PR_NUMBER-$(date -u +%Y-%m-%d-%H-%M-%S)"
log_info "Creating new branch: $NEW_BRANCH"
git checkout -b "$NEW_BRANCH" "pr-$PR_NUMBER"

# Push to fork
log_info "Pushing branch to fork..."
git push origin "$NEW_BRANCH"

log_info "Successfully cloned PR #$PR_NUMBER to fork!"
log_info "Branch '$NEW_BRANCH' has been created in $FORK_REPO"
log_info ""
# log_info "Next steps:"
# log_info "  1. To create a PR from the fork to the original repo:"
# log_info "     gh pr create --repo $FORK_REPO --head $FORK_OWNER:$NEW_BRANCH --base $PR_BASE_BRANCH --title \"$PR_TITLE\" --body \"$PR_BODY\""
# log_info "  2. Or visit: https://github.com/$ORIGINAL_REPO/compare/$PR_BASE_BRANCH...$FORK_OWNER:$NEW_BRANCH"

gh pr create --repo $FORK_REPO --head $FORK_OWNER:$NEW_BRANCH --base $PR_BASE_BRANCH --title "${PR_NUMBER}: ${PR_TITLE}" --body "${PR_NUMBER}: To review by AI" # --body \"$PR_BODY\"
