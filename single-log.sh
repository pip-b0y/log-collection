#!/bin/bash

#MacDeploy_log_collector
#As is might not collect it all.
#Saves log to /Users/Shared accesible via recovery drive.
#This script is different to V1, Predicate runs as one pid so might not catch enough
folderpath='/Users/Shared/support_logs'
####Script start
#check for a previous attempt incase 
if [ ! -d "/Users/Shared/support_logs" ]
then
	#no run detected
mkdir /Users/Shared/support_logs
else
	#there move on
echo "move on"
fi
log stream --debug --predicate 'subsystem == "com.apple.mac.install" OR subsystem == "com.apple.ManagedClient" OR subsystem == "com.jamf.management.binary" OR subsystem == "com.apple.appstored" OR process == "Setup Assistant" OR process == "mbuseragent" OR process == "mdmclient" OR process == "jamf" OR process == "appstored" OR process == "kernel"' >> ${folderpath}/Deployment.log &
