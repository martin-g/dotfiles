#!/bin/bash
#set -x
#trap read debug
set -o nounset
set -o errexit

#
# Merges Pull Requests from 'https://github.com/apache/wicket' 
# Uses 'jq' to parse JSON
# On Linux: aptitude install jq
# On Mac: brew install jq 
#
# Usage: github-pr.sh 63
#
# where 63 is the PR number
#

pr_number=$1

function die
{
	local prefix="[$(date +%Y/%m/%d\ %H:%M:%S)]: "
	echo "${prefix} ERROR: $@" 1>&2
	exit 10
}

# take the info about the PR
json=$(curl -s https://api.github.com/repos/apache/wicket/pulls/$pr_number)

err_message=$(echo $json | jq --raw-output '.message')
if [ "x$err_message" = "xNot Found" ]; then
	die "Cannot find the info about PR $pr_number" 
fi

# read the name of the current branch
current_branch_name=$(git rev-parse --abbrev-ref HEAD)

# read the name of the branch in the fork
branch_name=$(echo $json | jq --raw-output '.head .ref')

# read the name of the fork's owner
username=$(echo $json | jq --raw-output '.head .user .login')

# read the full_name of the users repo
repo_full_name=$(echo $json | jq --raw-output '.head .repo .full_name')

# read the clone_url of the users repo
repo_clone_url=$(echo $json | jq --raw-output '.head .repo .clone_url')

# the name of the local temporary branch
pr_branch_name="pr-$pr_number-$branch_name"

echo "Deleting branch '$pr_branch_name' in case it exists"
git branch -D $pr_branch_name 

echo "Creating the branch $pr_branch_name"
git checkout -b $pr_branch_name $current_branch_name

echo "Pulling the changes from $repo_clone_url $branch_name"
git pull $repo_clone_url $branch_name

echo "Merged the Pull Request, going to build the branch..."
read 
echo "Building..."
echo
mvn clean install -Pfast -Pjs-test

echo "Checking out the main branch - $current_branch_name ..."
git checkout $current_branch_name

echo "Execute 'git merge $pr_branch_name && git push origin $current_branch_name && git branch -d $pr_branch_name' if the build is successful"
