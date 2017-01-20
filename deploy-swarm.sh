#!/bin/bash

if [ -z "$1" ]
then
  echo "Usage: must pass the terraform directory"
  exit 1
fi

export OS_USERNAME=infra
export OS_PASSWORD=fei8LeDeDeeng9ge
export OS_AUTH_URL=http://192.168.3.1:5000/v2.0
export OS_TENANT_NAME=infra
export OS_REGION_NAME=RegionOne

cd $1
terraform $2 \
 -target openstack_compute_instance_v2.swarm-manager \
 -var swarm_init=true \
 -var swarm_managers=1

