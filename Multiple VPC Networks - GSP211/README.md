# Multiple VPC Networks - GSP211 Speedrun

## run

```bash
export ZONE_1=$(gcloud compute instances list mynet-vm-1 --format 'csv[no-heading](zone)')
export ZONE_2=$(gcloud compute instances list mynet-vm-2 --format 'csv[no-heading](zone)')

export REGION_1=$(echo "$ZONE_1" | cut -d '-' -f 1-2)
export REGION_2=$(echo "$ZONE_2" | cut -d '-' -f 1-2)


```