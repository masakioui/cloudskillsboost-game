#!/bin/bash
gcloud compute instances create vm-appliance \
--zone=$ZONE_1 \
--machine-type=e2-standard-4 \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=privatesubnet-1 \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=managementsubnet-1 \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=mynetwork