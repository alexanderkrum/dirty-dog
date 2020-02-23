#!/usr/local/bin/bash
./login.sh
read -p "Resource name: " resource_name
az account list-locations | jq -r '.[] | .name'
read -r -p "Location name: " location_name
echo "Creating resource group $resource_name in $location_name ....."
az group create -n $resource_name -l $location_name
