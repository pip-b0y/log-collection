# log-collection


There is a few types of scripts that you can run to collect some log predicates from the mac while you perform actions on the device. Currently this repo only has setup assistant centric scripts. Yes I know its not the best idea to curl a script and pipe it direct into Bash. But hey it gets the job done and thats what we want. 

#Usage mac-setup
For this repo, it is intended to be used with a mac in set up assitant to grab some logs from the device while it is getting set up to find issues with mdm deployment, like profiles not installing or skipping pre-stage enrollment ect. 

1) To activate terminal / console while in set up assistant. Move past the Language selection and the hello screen (is a must)

2) Press Control + Option + command + T all at the same time

3) Type in terminal the following one of two different commands
    i) For idividual log files for different processes and subsystems use this option:
    curl -k https://raw.githubusercontent.com/pip-b0y/log-collection/main/mac-setup/logs-seperate.sh | bash
    
    ii) For a single log file (if you are happy to traverse it all) use this option:
    curl -k https://raw.githubusercontent.com/pip-b0y/log-collection/main/mac-setup/logs-whole.sh | bash

4) Complete the set up of the mac. If the mac does the action you are expecting or not expecting, you can stop the logging by rebooting the device. It is important to reboot the device after everything is done

5) either log into the mac or boot into recovery, the logs are going to be located in /Users/Shared/support_logs
