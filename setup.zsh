#!/usr/bin/bash

_SETUP_PATH=$(cd `dirname $0`; pwd)

PATH=$_SETUP_PATH/bin:$PATH
PYTHONPATH=$_SETUP_PATH/lib/python3.6/site-packages:$PYTHONPATH
LD_LIBRARY_PATH=$_SETUP_PATH/lib:$LD_LIBRARY_PATH
LIBRARY_PATH=$_SETUP_PATH/lib:$LIBRARY_PATH
CMAKE_PREFIX_PATH=$_SETUP_PATH:$CMAKE_PREFIX_PATH
PKG_CONFIG_PATH=$_SETUP_PATH/lib/pkgconfig:$_SETUP_PATH/share/pkgconfig:$PKG_CONFIG_PATH
CYBER_PATH=$_SETUP_PATH/share/
export PATH LD_LIBRARY_PATH CMAKE_PREFIX_PATH PKG_CONFIG_PATH PYTHONPATH CYBER_PATH

export CYBER_DOMAIN_ID=80
export CYBER_IP=127.0.0.1

# export GLOG_log_dir="${APOLLO_ROOT_DIR}/data/log"
export GLOG_alsologtostderr=1
export GLOG_colorlogtostderr=1
export GLOG_minloglevel=0

export sysmo_start=0

