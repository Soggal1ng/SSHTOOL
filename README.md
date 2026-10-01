# SSH BruteForce Tool (v1.0)

A lightweight, automated Windows batch script designed to streamline SSH security auditing and credential testing using the **Metasploit Framework** and **Nmap**.

---

## 🚀 Features

- **Automated Dependency Checks:** Automatically verifies if `msfconsole` and `nmap` are installed and available in your system path before execution.
- **Dynamic Resource Script Generation:** Automatically builds a Metasploit resource script (`ssh.rc`) targeting the specified host and wordlists.
- **Robust Log Parsing:** Features clean `for /f` loop parsing logic to accurately capture successful `user:password` pairs from Metasploit's output logs without standard overwriting bugs.
- **Nmap Enumeration:** Automatically follows up with an Nmap script (`ssh-auth-methods`) to inspect supported authentication mechanisms on the target port 22.
- **Buffer Safety:** Includes OS sleep/timeout delays to ensure log files are fully flushed to disk before parsing begins.

---

## 🛠️ Prerequisites

Before running the script, ensure you have the following tools installed and configured in your Windows environment `PATH`:
1. **Metasploit Framework** ([Download / Docs](https://metasploit.help.rapid7.com/docs/installing-the-metasploit-framework))
2. **Nmap** ([Download](https://nmap.org/download.html))

---

## 📥 Usage

1. Place your batch script in your desired working directory.
2. Ensure you have your target text files ready (e.g., a username text file and a password text file).
3. Execute the batch file:
   ```cmd
   script.bat
   ```
4. Follow the interactive prompts in the terminal:
   - Enter your target IP address or hostname.
   - Enter the path to your username list file.
   - Enter the path to your password list file.

---

## 📂 Generated Files

During execution, the script temporarily creates and cleans up the following local files in your working directory:
- `ssh.rc` — Metasploit resource execution script.
- `ssh.log` — Spooled output log containing scan and brute-force results.

---

## ⚠️ Disclaimer

This tool is strictly intended for educational purposes, authorized security testing, and system administration audits. Do not run this script against any systems or networks without explicit, written permission from the owner. 

---