#!/bin/bash
#Version 1.0
#MacDeploy_log_collector seperate
#As is might not collect it all.
#Saves logs to /Users/Shared accesible via recovery drive.
#This script breaks it down to subfiles 
folderpath='/Users/Shared/support_logs'

if [ ! -d "/Users/Shared/support_logs" ]
then
	#no run detected
	mkdir /Users/Shared/support_logs
else
	#there move on
	echo "move on"
fi
#check for previous run

##Setup assistant window log capture
log stream --debug --predicate 'subsystem == "com.apple.mac.install"' >> ${folderpath}/sub_setup_assitant.log &
log stream --debug --predicate 'process == "Setup Assistant"' >> ${folderpath}/p_setup_assitant.log &
log stream --debug --predicate 'process == "mbuseragent"' >> ${folderpath}/p_mbuseragent.log &
###
##Managed Client log capture
log stream --debug --predicate 'subsystem == "com.apple.ManagedClient"' >> ${folderpath}/sub_managedclient.log &
log stream --debug --predicate 'process == "mdmclient"' >> ${folderpath}/p_managedclient.log &
###
##Jamf Binary log capture
log stream --debug --predicate 'subsystem == "com.jamf.management.binary"' >> ${folderpath}/sub_jamf.log &
log stream --debug --predicate 'process == "jamf"' >> ${folderpath}/p_jamf.log &
###
##AppStore/Enterprise App installs
log stream --debug --predicate 'subsystem == "com.apple.appstored"' >> ${folderpath}/sub_appstore.log &
log stream --debug --predicate 'process == "appstored"' >> ${folderpath}/p_appstore.log &
###
##Kernel
log stream --debug --predicate 'process == "kernel"' >> ${folderpath}/p_kernel.log &
