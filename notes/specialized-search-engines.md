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

# 🏋️‍♂️ Exercises: Specialized Search Engines

---

## 🔎 Shodan Exercises

1. **Find all Apache servers in Germany**
   - 🔑 Search Query:  
     ```
     apache country:"DE"
     ```

2. **Find exposed MongoDB databases (no authentication)**
   - 🔑 Search Query:  
     ```
     product:"MongoDB" port:27017
     ```

3. **List webcams accessible over the internet**
   - 🔑 Search Query:  
     ```
     title:"webcamXP"
     ```

---

## 🔎 Censys Exercises

1. **Find expired SSL certificates**
   - 🔑 Search Query:  
     ```
     validation.nss.validity.end < now
     ```

2. **Find all IPv4 hosts with open port 21 (FTP)**
   - 🔑 Search Query:  
     ```
     services.service_name: "FTP"
     ```

3. **Search for domains with Let's Encrypt certificates**
   - 🔑 Search Query:  
     ```
     parsed.names: "example.com" AND parsed.issuer.organization: "Let's Encrypt"
     ```

---

## 🦠 VirusTotal Exercises

1. **Check a suspicious domain for malware reports**
   - 📂 Example Domain: `suspicious-example.com`
   - 🔑 Action: Paste into search bar at https://www.virustotal.com

2. **Submit a file hash for analysis**
   - 📂 Example Hash: `d41d8cd98f00b204e9800998ecf8427e`
   - 🔑 Action: Paste the hash into VirusTotal search.

3. **Explore the graph view for a domain’s relationships**
   - 🔑 Action: After searching a domain, click on “Graph”.

---

## ⚠️ Warning
- ⚙️ **Use responsibly**: Never scan or access systems you don’t have permission for.
- 👨‍💻 These exercises are for learning **OSINT** and analysis, not exploitation.

---
