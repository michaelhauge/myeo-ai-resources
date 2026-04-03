> **Not a security expert?** Start with the [SMB Cybersecurity Guide](../smb-cybersecurity-guide/) instead — it covers the same protections using browser-based tools and checklists, no command line required. Return here when you want to run automated audits across your systems.

---

# Security Audit Toolkit

A comprehensive, cross-platform security audit toolkit for developers, system administrators, and security professionals. Run red team assessments on your own systems to identify vulnerabilities before attackers do.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20Windows-blue)]()

## Quick Start

### macOS
```bash
# Clone the repo
git clone https://github.com/michaelhauge/myeo-ai-resources.git
cd myeo-ai-resources/security-audit-toolkit

# Run full audit
chmod +x scripts/macos/*.sh
./scripts/macos/full-audit.sh
```

### Linux
```bash
# Clone the repo
git clone https://github.com/michaelhauge/myeo-ai-resources.git
cd myeo-ai-resources/security-audit-toolkit

# Run full audit
chmod +x scripts/linux/*.sh
./scripts/linux/full-audit.sh

# Or with auto-fix
./scripts/linux/full-audit.sh --fix
```

### Windows (PowerShell)
```powershell
# Clone the repo
git clone https://github.com/michaelhauge/myeo-ai-resources.git
cd myeo-ai-resources\security-audit-toolkit

# Run full audit (may require admin for some checks)
.\scripts\windows\full-audit.ps1

# Or with auto-fix
.\scripts\windows\full-audit.ps1 -Fix

# Dry-run remediation (see what would change)
.\scripts\windows\remediate.ps1 -DryRun
```

## What This Toolkit Checks

### Network Security
- Open ports exposed to the network (not just localhost)
- Firewall status and configuration
- File sharing services (SMB, AFP, NFS)
- Remote access services (SSH, VNC, RDP)
- Guest access on shared resources

### Credential Security
- `.env` files with world-readable permissions
- API keys and tokens in common locations
- SSH key permissions
- Cloud credential files (AWS, GCP, Azure)
- Secrets accidentally committed to git

### System Hardening
- Disk encryption status
- Screen lock configuration
- Automatic updates
- Secure boot status

## Repository Structure

```
security-audit-toolkit/
├── scripts/           # Automated audit scripts
│   ├── macos/        # macOS-specific scripts
│   ├── linux/        # Linux-specific scripts
│   └── windows/      # Windows PowerShell scripts
├── checklists/       # Manual audit checklists
├── guides/           # How-to documentation
│   ├── beginners/    # Non-technical guides
│   ├── technical/    # Developer-focused guides
│   └── platform-specific/
├── templates/        # Reusable templates
└── examples/         # Sample outputs and reports
```

## Audit Scripts

| Script (macOS/Linux) | Script (Windows) | Description |
|---------------------|------------------|-------------|
| `full-audit.sh` | `full-audit.ps1` | Run all security checks |
| `network-audit.sh` | `network-audit.ps1` | Check network exposure only |
| `credential-audit.sh` | `credential-audit.ps1` | Check credential security only |
| `remediate.sh` | `remediate.ps1` | Auto-fix common issues |

### Linux Script Features
- **Firewall detection**: UFW, firewalld, and iptables support
- **Service analysis**: Uses `ss` for network socket inspection
- **Permission checks**: `stat -c` for cross-distro compatibility
- **fail2ban**: Checks for SSH brute-force protection
- **LUKS**: Detects disk encryption status
- **SSH hardening**: Checks root login, password auth, key-only access
- **Automatic updates**: Detects unattended-upgrades (Debian/Ubuntu) and dnf-automatic (RHEL/Fedora)

### Windows Script Features
- **Windows Firewall**: Checks all profiles (Domain, Private, Public)
- **Windows Defender**: Antivirus status, real-time protection, signature age
- **Network exposure**: Uses `Get-NetTCPConnection` for port analysis
- **BitLocker**: Disk encryption status
- **UAC**: User Account Control verification
- **Remote Desktop**: RDP status and WinRM checks
- **Credential Manager**: Enumerates stored Windows credentials
- **Git integration**: Configures Windows Credential Manager for git

## Checklists

- **[Red Team Checklist](checklists/red-team-checklist.md)** - Comprehensive 30+ point security audit
- **[Quick Security Check](checklists/quick-security-check.md)** - 5-minute basic assessment
- **[Pre-Deployment Checklist](checklists/pre-deployment.md)** - Before going to production
- **[Monthly Maintenance](checklists/monthly-maintenance.md)** - Recurring security tasks

## Guides

### For Beginners
- [What is a Security Audit?](guides/beginners/what-is-security-audit.md)
- [Understanding File Permissions](guides/beginners/understanding-permissions.md)
- [GUI Security Settings](guides/beginners/gui-security-settings.md)

### For Developers
- [Credential Rotation Best Practices](guides/technical/credential-rotation.md)
- [Secure Remote Access Setup](guides/technical/secure-remote-access.md)
- [.env File Security](guides/technical/env-file-security.md)
- [Secret Detection in Code](guides/technical/secret-detection.md)

### Platform-Specific
- [macOS Hardening Guide](guides/platform-specific/macos-hardening.md)
- [Linux Hardening Guide](guides/platform-specific/linux-hardening.md)
- [Windows Hardening Guide](guides/platform-specific/windows-hardening.md)

## Sample Output

```
=== SECURITY AUDIT REPORT ===
Date: 2024-01-15 14:30:00
System: macOS 14.2 (Sonoma)

[PASS] Firewall enabled
[PASS] Stealth mode enabled
[WARN] SSH exposed on all interfaces (0.0.0.0:22)
[FAIL] SMB guest access enabled
[PASS] All .env files have 600 permissions
[WARN] 2 credential files have 644 permissions

Summary: 2 PASS | 2 WARN | 1 FAIL
```

## What Goes Wrong and How to Fix It

### "The audit script won't run — permission denied"

**Symptom**: Running `./scripts/macos/full-audit.sh` returns "Permission denied" or "command not found."

**Likely cause**: The script doesn't have execute permissions, or you're running it from the wrong directory.

**Fix**:
1. Make scripts executable: `chmod +x scripts/macos/*.sh` (or `linux/*.sh`)
2. Verify you're in the right directory: `ls scripts/` should show `macos/`, `linux/`, `windows/`
3. On macOS, if you get a Gatekeeper warning ("cannot be opened because the developer cannot be verified"), right-click → Open, or run: `xattr -d com.apple.quarantine scripts/macos/full-audit.sh`

**Prevention**: After cloning the repo, always run `chmod +x scripts/**/*.sh` once to set all permissions.

---

### "I'm getting tons of FAIL/WARN results — is my machine compromised?"

**Symptom**: First audit run shows 15+ warnings and 5+ failures. Panic ensues.

**Likely cause**: Most developer machines haven't been hardened. Default OS configurations leave many ports open, permissions loose, and security features disabled. This doesn't mean you've been hacked — it means you have work to do.

**Fix**:
1. Don't panic — read each finding carefully. Most are configuration issues, not active threats
2. Prioritize: Fix FAIL items first (actual vulnerabilities), then WARN (best practices)
3. Use the remediation script: `./scripts/macos/remediate.sh` (or `--fix` flag on Linux) to auto-fix common issues
4. Re-run the audit after fixing: compare before/after scores

**Prevention**: Run the quick security check (`checklists/quick-security-check.md`) monthly. Schedule a full audit quarterly. Fixing issues incrementally is much less overwhelming than seeing 20 failures at once.

---

### "The audit found exposed credentials — what do I do?"

**Symptom**: Audit reports `.env` files with world-readable permissions, API keys in git history, or cloud credential files with loose permissions.

**Likely cause**: Default file creation permissions are often 644 (world-readable). Developers frequently commit `.env` files accidentally, and credential files from `aws configure` or `gcloud init` default to readable permissions.

**Fix**:
1. **Immediately rotate any exposed credentials** — change API keys, tokens, and passwords that were found
2. Fix permissions: `chmod 600 ~/.aws/credentials ~/.env` (owner-only read/write)
3. If credentials were committed to git: use `git filter-branch` or BFG Repo Cleaner to remove from history
4. Add `.env` and credential files to `.gitignore`

**Prevention**: Add a pre-commit hook that blocks commits containing secrets (use `detect-secrets` or `gitleaks`). Set file creation umask to 077 in your shell profile.

---

### "Windows audit requires admin but I'm not an admin"

**Symptom**: PowerShell script fails with "Access Denied" or shows incomplete results because some checks require elevated privileges.

**Likely cause**: Many Windows security checks (BitLocker status, firewall configuration, Windows Defender settings) require administrator access. Non-admin users can only see a subset of the security posture.

**Fix**:
1. Right-click PowerShell → "Run as Administrator" → re-run the script
2. If you're on a corporate machine without admin rights, run with `-SkipAdmin` flag to get partial results, then share the output with your IT team for the admin-required checks
3. Use the dry-run remediation: `.\scripts\windows\remediate.ps1 -DryRun` to see what would change without making changes

**Prevention**: Coordinate with your IT department before running audits on corporate machines. Share the toolkit documentation so they understand what the scripts check and can approve admin access.

---

### "Audit results differ between my Mac and my Linux server"

**Symptom**: Your Mac passes most checks but your Linux server fails many, or vice versa. The reports look completely different.

**Likely cause**: macOS and Linux have different default security configurations, different firewall systems (pf vs iptables/ufw), and different credential storage mechanisms. The scripts check platform-appropriate items, so results aren't directly comparable.

**Fix**:
1. This is expected behavior — don't try to make scores match across platforms
2. Focus on platform-specific priorities: macOS (FileVault, Gatekeeper, firewall), Linux (SSH hardening, fail2ban, LUKS encryption)
3. Use the platform-specific hardening guides (`guides/platform-specific/`) for remediation steps tailored to each OS
4. Compare against the same platform over time (not across platforms)

**Prevention**: Track audit scores per platform over time using the monthly maintenance checklist (`checklists/monthly-maintenance.md`). Aim for improvement trends, not cross-platform parity.

---

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Built from real-world security audits and red team assessments. Special thanks to the security community for sharing knowledge and best practices.

---

**Disclaimer:** This toolkit is for authorized security testing only. Always obtain proper authorization before running security audits on systems you don't own.
