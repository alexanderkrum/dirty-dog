#!/usr/local/bin/bash
./login.sh
echo "Resource groups: "
resource_names=$(az group list | jq -r '.[] | .name')
if [[ ! $resource_names ]]
then
    echo "No resources found."
    exit 0
fi
echo $resource_names
read -p "Resource group name to delete: " group_name
az group delete -n $group_name