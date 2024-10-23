#!/bin/bash

# Function to display a header
display_header() {
    echo -e "\n\033[1m$1\033[0m"
}

# Display storage information
display_header "Storage Information"
df -h --output=source,size,used | grep -vE '^Filesystem|tmpfs|cdrom' # Display total and used storage, excluding certain filesystems

# Display top running task
display_header "Top Running Task"
top -bn1 | head -n 20 # Display top 20 lines from the top command to show the top tasks

echo '!EmpowerChain-Incentivised-Testnet-Guides /IBC_TASKS.txt' >>.git/info/sparse-checkout
