#!/usr/bin/with-contenv bash

set -eu
set -o pipefail


ip link set "${NAT_NAME}_1" down
brctl delbr "${NAT_NAME}_1"
ip link set "${NAT_NAME}_2" down
brctl delbr "${NAT_NAME}_2"


printf '%s\n' '-------------------------------'
printf '%s\n' 'DEINIT -- NAT'
printf '%s\n' '-------------------------------'


VM_IP="$(< /vmrc/ip_addr)"
route-nat --bridge "$NAT_NAME" --ip "$VM_IP" --state off


printf '%s\n' '-------------------------------'
printf '%s\n' 'DEINIT -- IPTABLES'
printf '%s\n' '-------------------------------'

