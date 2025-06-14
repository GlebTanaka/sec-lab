#!/bin/bash

# domain_scanner.sh - Enhanced domain reconnaissance script with custom wordlist support

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

DEFAULT_WORDLIST="./wordlist.txt"
WORDLIST="$DEFAULT_WORDLIST"

usage() {
    echo -e "${YELLOW}Usage: $0 <domain> [--brute] [--headers] [--wordlist <file>]${NC}"
    echo "  --brute         Run subdomain brute-force using wordlist"
    echo "  --headers       Fetch HTTP headers of the domain"
    echo "  --wordlist FILE Specify a custom wordlist for brute-force"
    exit 1
}

if [ -z "$1" ]; then
    usage
fi

DOMAIN="$1"
shift

BRUTE=0
HEADERS=0

# Argument parsing loop
while [[ $# -gt 0 ]]; do
    case "$1" in
        --brute)
            BRUTE=1
            ;;
        --headers)
            HEADERS=1
            ;;
        --wordlist)
            shift
            if [ -z "$1" ]; then
                echo -e "${RED}[!] Missing filename for --wordlist${NC}"
                usage
            fi
            WORDLIST="$1"
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            usage
            ;;
    esac
    shift
done

echo -e "${BLUE}🔎 Scanning domain: $DOMAIN${NC}"
echo "----------------------------"

# Resolve IP
echo -e "${YELLOW}[*] Resolving IP address...${NC}"
IP=$(dig +short "$DOMAIN")
if [ -z "$IP" ]; then
    echo -e "${RED}[!] Could not resolve domain.${NC}"
else
    echo -e "${GREEN}$IP${NC}"
fi

# Nameservers
echo -e "${YELLOW}[*] Nameservers:${NC}"
dig NS "$DOMAIN" +short

# MX Records
echo -e "${YELLOW}[*] Mail Servers (MX):${NC}"
dig MX "$DOMAIN" +short

# Subdomain brute-force
if [ $BRUTE -eq 1 ]; then
    echo -e "${YELLOW}[*] Subdomain brute-force:${NC}"

    if [ ! -f "$WORDLIST" ]; then
        echo -e "${RED}[!] Wordlist not found: $WORDLIST${NC}"
    else
        while read -r sub; do
            RESULT=$(dig +short "$sub.$DOMAIN")
            if [ -n "$RESULT" ]; then
                echo -e "${GREEN}$sub.$DOMAIN → $RESULT${NC}"
            fi
        done < "$WORDLIST"
    fi
fi

# HTTP Headers
if [ $HEADERS -eq 1 ]; then
    echo -e "${YELLOW}[*] HTTP Headers:${NC}"
    curl -sI --max-time 5 "http://$DOMAIN" | head -n 10
fi

echo -e "${BLUE}----------------------------${NC}"
echo -e "${GREEN}✅ Scan complete.${NC}"
