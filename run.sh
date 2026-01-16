# Trigger rebuild v1 - $(date)
#!/usr/bin/env bash
set -e

# Read HA add-on options
CONFIG_ID="${NEXTDNS_PROFILE_ID:-}"
LISTEN="${NEXTDNS_LISTEN:-:53}"

# Validate required config
if [[ -z "$CONFIG_ID" ]]; then
  echo "Error: NEXTDNS_PROFILE_ID environment variable is required. Set in add-on OPTIONS."
  exit 1
fi

echo "Starting NextDNS CLI with profile: $CONFIG_ID"
echo "Listening on: $LISTEN"

# Run NextDNS (host_network mode passes real client IPs)
exec nextdns run \
  -config "$CONFIG_ID" \
  -listen "$LISTEN" \
  -report-client-ip \
  -check-dnsmasq=false \
  -upstream-doh google \
  "-logfile" "/config/nextdns.log"
