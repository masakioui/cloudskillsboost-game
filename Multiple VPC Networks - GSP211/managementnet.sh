#!/bin/bash

export ZONE_1=$(gcloud compute instances list mynet-vm-1 --format 'csv[no-heading](zone)')
export REGION_1=$(echo "$ZONE_1" | cut -d '-' -f 1-2)

gcloud compute networks create managementnet --subnet-mode=custom 

gcloud compute networks subnets create managementsubnet-1 --network=managementnet --region=$REGION_1 --range=10.130.0.0/20 

gcloud compute firewall-rules create managementnet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=managementnet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0 --quiet &

gcloud compute instances create managementnet-vm-1 --zone=$ZONE_1 --machine-type=e2-micro --subnet=managementsubnet-1 --quiet &