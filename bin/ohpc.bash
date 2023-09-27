#!/usr/bin/env bash

set -xe

OHPC_HOME=$HOME/git/huawei/openeuler-ohpc
OSC_HOME=$HOME/obs/home:mgrigorov
OLD_CWD=$PWD

cd $OSC_HOME

group=$1
pkg=$2
compiler_family=${3:-gnu12}
mpi_family=${4:-openmpi4}
pkg_dir=${OSC_HOME}/${pkg}-${compiler_family}-${mpi_family}
spec_file=${pkg}.spec
branch_name=${group}--${pkg}

cd $OHPC_HOME
git switch ${branch_name}  > /dev/null || git checkout -b ${branch_name}
# if test ! -d ${pkg_dir}; then 
    mkdir -vp ${pkg_dir};
    yes | cp components/OHPC_macros components/${group}/${pkg}/SOURCES/
    misc/get_source.sh ${pkg}.spec
    rm components/${group}/${pkg}/SOURCES/OHPC_macros
# fi

cd $OSC_HOME
cp $OHPC_HOME/components/${group}/${pkg}/SPECS/* ${pkg_dir}/
cp $OHPC_HOME/components/${group}/${pkg}/SOURCES/* ${pkg_dir}/
cp $OHPC_HOME/components/OHPC_macros ${pkg_dir}/
osc add ${pkg_dir}
cd ${pkg_dir}
osc add *
osc commit -n

cd $OLD_CWD
