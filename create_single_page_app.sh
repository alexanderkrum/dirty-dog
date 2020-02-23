#!/usr/local/bin/bash
read -p "Enter app name: " app_name
echo "Resource groups:"
group_list=$(az group list)

echo $group_list | jq -r '.[] | .name'

read -p "Choose resource name: " resource_group_name
group_location=$(echo $group_list | jq -r --arg name "$resource_group_name" '.[] | select(.name == $name) | .location')

az storage account create \
    -n $app_name \
    -g $resource_group_name \
    -l $group_location \
    --sku Standard_LRS

