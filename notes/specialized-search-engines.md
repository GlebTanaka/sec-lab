# Specialized Search Engines

Tools for discovering exposed services, IPs, domains, and malware analysis.

---

## 🔎 1. Shodan (https://www.shodan.io)

### What it does
- Search for internet-connected devices and services.
- Filters by IP, port, service banners, organization, country.
- Example searches:
  - `apache country:"DE"`
  - `org:"Siemens"`

### Typical use cases
- Attack surface mapping
- Vulnerability hunting
- IoT device discovery

### Useful filters
- `port:`
- `org:`
- `hostname:`
- `os:`

---

## 🔎 2. Censys (https://search.censys.io/)

### What it does
- Similar to Shodan but with a more academic focus.
- Rich TLS/SSL certificate search.
- Tracks infrastructure on IPv4 & domains.

### Typical use cases
- Finding expired or misconfigured SSL certificates
- Finding services by certificate fingerprint

---

## 🦠 3. VirusTotal (https://www.virustotal.com/)

### What it does
- File and URL scanning against 70+ antivirus engines.
- Passive DNS, relationships between files, IPs, domains.
- API available for automation.

### Typical use cases
- Malware analysis
- Checking suspicious URLs/domains/IPs
- Threat hunting

---

## 🔗 Related tools
- https://fofa.so/ (Chinese alternative to Shodan/Censys)
- https://binaryedge.io/

---
