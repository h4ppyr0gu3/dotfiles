#!/bin/bash

ip_address=$(curl -4 icanhazip.com)

existing_data=$(
curl -X GET "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records?name=$DOMAIN_NAME" \
  -H "X-Auth-Email: $EMAIL" \
  -H "Authorization: Bearer $CLOUDFLARE_AUTH_KEY"
)

domain_id=$(echo $existing_data | jq '.result[0].id' | tr -d '"')

cloudflare_update_url="https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/$domain_id"

update_status=$(
curl -X PUT $cloudflare_update_url \
     -H "X-Auth-Email: $EMAIL" \
     -H "Authorization: Bearer $CLOUDFLARE_AUTH_KEY" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"$DOMAIN_NAME\",\"content\":\"$ip_address\",\"ttl\":1,\"proxied\":true}"
)

status=$(echo $update_status | jq '.success')

if $status; then
  exit(0)
fi

# send slack notification 
