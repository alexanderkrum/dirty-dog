if [[ ! $(az account show) ]]
then
az login
fi