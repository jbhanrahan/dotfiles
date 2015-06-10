#!/bin/bash

IFS=$'\n' read -rd '' -a addrs <<<"$(aws ec2 describe-instances --region us-west-1 --filters "Name=tag:role,Values=v1-backchannel" "Name=tag:environment,Values=prod-usw1" --query "Reservations[*].Instances[*].[PublicIpAddress]" --output text)"

function restartWorkers(){ 
  ssh $1 'sudo -u web -H sh -c "/home/web/current/scripts/start_backchannel_workers.sh production 10"' 2>&1
}

function dropCaches(){
  ssh $1 'sudo -H sh -c "echo 2 > /proc/sys/vm/drop_caches"' 2>&1
}


for addr in "${addrs[@]}" 
do
  echo "$addr: $(restartWorkers $addr)"
done

for addr in "${addrs[@]}" 
do
  dropCaches $addr
  echo "dropped caches for $addr"
done

