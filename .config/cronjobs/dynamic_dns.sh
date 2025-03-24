#!/bin/bash

source $HOME/.config/.env

ip_address=$(curl -4 icanhazip.com)
prev_ip_address=$(cat $HOME/.ip_address)

if [ "$ip_address" = "$prev_ip_address" ]; then
  exit
fi

echo $ip_address > $HOME/.ip_address

# get_existing_data domain_name
get_existing_data () {
  curl -X GET "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records?name=$1" \
    -H "X-Auth-Email: $EMAIL" \
    -H "Authorization: Bearer $CLOUDFLARE_AUTH_KEY"
  }

# update_ip_address domain_id domain_name proxied
update_ip_address () {
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/$1" \
    -H "X-Auth-Email: $EMAIL" \
    -H "Authorization: Bearer $CLOUDFLARE_AUTH_KEY" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$2\",\"content\":\"$ip_address\",\"ttl\":1,\"proxied\":$3}"
  }

  existing_data=$(get_existing_data $DOMAIN_NAME)
  existing_ssh_data=$(get_existing_data $SSH_DOMAIN_NAME)
  existing_wildcard_data=$(get_existing_data $WILDCARD_DOMAIN_NAMW)
  domain_id=$(echo $existing_data | jq '.result[0].id' | tr -d '"')
  ssh_domain_id=$(echo $existing_ssh_data | jq '.result[0].id' | tr -d '"')
  wildcard_domain_id=$(echo $existing_wildcard_data | jq '.result[0].id' | tr -d '"')
  update_status=$(update_ip_address $domain_id $DOMAIN_NAME true)
  update_ssh_status=$(update_ip_address $ssh_domain_id $SSH_DOMAIN_NAME false)
  update_wildcard_status=$(update_ip_address $wildcard_domain_id $WILDCARD_DOMAIN_NAME true)
  status=$(echo $update_status | jq '.success')
  ssh_status=$(echo $update_ssh_status | jq '.success')
  wildcard_status=$(echo $update_wildcard_status | jq '.success')

  if $status; then
    if $ssh_status; then
      if $wildcard_status; then
        exit
      fi
    fi
  fi

# this will cause it to retry every time
rm $HOME/.ip_address

# send slack notification 
