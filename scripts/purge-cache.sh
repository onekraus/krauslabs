#!/usr/bin/env bash
# Purge Cloudflare CDN cache for krauslabs.com
#
# Requires CLOUDFLARE_API_TOKEN with Zone > Cache Purge permission.
# Set it in ~/.krauslabs-secrets.env (or any env file you source first), or pass inline:
#   CLOUDFLARE_API_TOKEN=xxx npm run purge

set -euo pipefail

# Auto-source secrets file if it exists
if [ -f "$HOME/.krauslabs-secrets.env" ]; then
  # shellcheck disable=SC1091
  source "$HOME/.krauslabs-secrets.env"
fi

if [ -z "${CLOUDFLARE_API_TOKEN:-}" ]; then
  echo "✗ CLOUDFLARE_API_TOKEN not set."
  echo "  Create one at: Cloudflare dashboard > My Profile > API Tokens"
  echo "  Permission needed: Zone > Cache Purge > Purge"
  echo "  Then add to ~/.krauslabs-secrets.env: CLOUDFLARE_API_TOKEN=xxx"
  exit 1
fi

ZONE_ID="0f92ca5981d7674b5155880164aa9309"

echo "→ Purging Cloudflare cache for krauslabs.com…"
RESPONSE=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/purge_cache" \
  -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{"purge_everything":true}')

if echo "$RESPONSE" | grep -q '"success":true'; then
  echo "✓ Cache purged successfully."
else
  echo "✗ Purge failed:"
  echo "$RESPONSE"
  exit 1
fi
