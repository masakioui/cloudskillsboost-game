#!/bin/bash
# Create the private network
gcloud compute networks create privatenet --subnet-mode=custom

# Create the first private subnet in the first region
gcloud compute networks subnets create privatesubnet-1 --network=privatenet --region=$REGION_1 --range=172.16.0.0/24 --quiet &

# Create the second private subnet in the second region
gcloud compute networks subnets create privatesubnet-2 --network=privatenet --region=$REGION_2 --range=172.20.0.0/20

gcloud compute firewall-rules create privatenet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=privatenet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0 --quiet &

# Create Instances
gcloud compute instances create privatenet-vm-1 --zone=$ZONE_1 --machine-type=e2-micro --subnet=privatesubnet-1 --quiet &