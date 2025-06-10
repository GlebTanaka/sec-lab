#!/bin/bash

# domain_scanner.sh
# Basic recon script for gathering domain information.

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN="$1"

echo "Scanning domain: $DOMAIN"
echo "----------------------------"

# 1 Resolve IP Address
echo "[*] Resolving IP address..."
dig +short "$DOMAIN"

# 2 Nameserver Information
echo "[*] Nameservers:"
dig NS "$DOMAIN" +short

# 3 Mail Servers (MX records)
echo "[*] Mail Servers (MX records):"
dig MX "$DOMAIN" +short

# 4 Subdomain Bruteforce (optional, using wordlist)
# Uncomment below if you have a wordlist.txt
# echo "[*] Subdomain brute-force:"
# for sub in $(cat wordlist.txt); do
#     host "$sub.$DOMAIN" | grep "has address"
# done

# 5 Grab HTTP Headers (optional)
# echo "[*] HTTP Headers:"
# curl -I "http://$DOMAIN" 2>/dev/null | head -n 10

echo "----------------------------"
echo "✅ Scan complete."