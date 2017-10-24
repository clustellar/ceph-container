#!/bin/bash


#############
# VARIABLES #
#############
CEPH_DEMO_UID=demo
CEPH_DEMO_ACCESS_KEY=
CEPH_DEMO_SECRET_KEY=


#############
# FUNCTIONS #
#############
function is_rgw_port_available {

}

function find_local_ip {

}

function run_ceph_aio {
  echo "Running Ceph container..."
  docker run -d \
  --name demo \
  -e CEPH_DEMO_UID=$CEPH_DEMO_UID \
  -e CEPH_DEMO_ACCESS_KEY=$CEPH_DEMO_ACCESS_KEY \
  -e CEPH_DEMO_SECRET_KEY=$CEPH_DEMO_SECRET_KEY \
  -e NETWORK_AUTO_DETECT=1 \
  -p 8000:8000
  ceph/daemon demo &> /dev/null
}


########
# MAIN #
########

find_local_ip
is_rgw_port_available
run_ceph_aio

echo "Rados Gateway is available at: http://$IP:$PORT"
echo "Acess key is: $CEPH_DEMO_ACCESS_KEY"
echo "Secret key is: $CEPH_DEMO_SECRET_KEY"
