## About This Project

This repository contains five shell scripts written as part of the Open Source Software capstone project. The chosen software is Git, the distributed version control system created by Linus Torvalds in 2005. All scripts are written for Ubuntu Linux and tested on Ubuntu 22.04 LTS.

---

## Repository Contents

| File | Description |
|------|-------------|
| script1_system_identity.sh | Displays system info: kernel, user, uptime, license |
| script2_package_inspector.sh | Checks if a package is installed and prints a philosophy note |
| script3_disk_permission_auditor.sh | Audits directory permissions and disk usage |
| script4_log_analyzer.sh | Counts keyword occurrences in a log file |
| script5_manifesto_generator.sh | Interactive tool that generates an open source manifesto |

---

## Requirements

- Ubuntu 22.04 LTS (or any Debian-based Linux system)
- Git installed: `sudo apt install git -y`
- Bash (pre-installed on Ubuntu)
- lsb-release package for Script 1: `sudo apt install lsb-release -y`

---

## How to Run Each Script

**Step 1: Clone the repository**
```bash
git clone https://github.com/[your-username]/oss-audit-24BAI10294.git
cd oss-audit-24BAI10294
```

**Step 2: Make all scripts executable**
```bash
chmod +x *.sh
```

**Script 1: System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2: FOSS Package Inspector**
```bash
./script2_package_inspector.sh git
# Replace 'git' with any package name to inspect a different package
```

**Script 3: Disk and Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
# No arguments needed. Runs automatically.
```

**Script 4: Log File Analyzer**
```bash
./script4_log_analyzer.sh /var/log/syslog error
# First argument: path to any log file
# Second argument: keyword to search for (default is 'error')
```

**Script 5: Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
# Interactive. Will ask you three questions.
# Saves output to manifesto_[username].txt in the current directory.
```

---

## Notes

- Script 4 requires a non-empty log file. `/var/log/syslog` works on Ubuntu. If syslog is not present, try `/var/log/auth.log` or `/var/log/kern.log`
- All scripts include inline comments explaining each section.
- Scripts were tested on VirtualBox running Ubuntu 22.04 LTS.