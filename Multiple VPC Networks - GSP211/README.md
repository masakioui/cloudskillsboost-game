# Multiple VPC Networks - GSP211 Speedrun

## run

```bash
export ZONE_1=$(gcloud compute instances list mynet-vm-1 --format 'csv[no-heading](zone)')
export ZONE_2=$(gcloud compute instances list mynet-vm-2 --format 'csv[no-heading](zone)')

export REGION_1=$(echo "$ZONE_1" | cut -d '-' -f 1-2)
export REGION_2=$(echo "$ZONE_2" | cut -d '-' -f 1-2)

curl -LO https://raw.githubusercontent.com/masakioui/cloudskillsboost-game/refs/heads/main/Multiple%20VPC%20Networks%20-%20GSP211/managementnet.sh

curl -LO https://raw.githubusercontent.com/masakioui/cloudskillsboost-game/refs/heads/main/Multiple%20VPC%20Networks%20-%20GSP211/privatenet.sh

curl -LO https://raw.githubusercontent.com/masakioui/cloudskillsboost-game/refs/heads/main/Multiple%20VPC%20Networks%20-%20GSP211/vm-appliance.sh

sudo chmod +x *.sh

./managementnet.sh &
./privatenet.sh &
sleep 10
./vm-appliance.sh
```
