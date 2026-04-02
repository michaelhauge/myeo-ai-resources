# Quick Security Check (5 Minutes)

A fast security assessment you can run anytime. Perfect for:
- Before connecting to public WiFi
- After installing new software
- Weekly health checks

---

## The 5-Minute Checklist

### 1. Firewall (30 seconds)

**macOS:**
```bash
/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
```
Expected: `Firewall is enabled`

**Linux:**
```bash
sudo ufw status
```
Expected: `Status: active`

**Windows (PowerShell):**
```powershell
Get-NetFirewallProfile | Select Name, Enabled
```
Expected: All profiles `Enabled: True`

---

### 2. Exposed Ports (1 minute)

```bash
# macOS/Linux
netstat -an | grep LISTEN | grep -E '(\*\.|0\.0\.0\.0)'
```

**Red flags:**
- Port 445 (SMB) - File sharing exposed
- Port 5900 (VNC) - Screen sharing exposed
- Port 3306/5432/27017 (Databases) - Should be localhost only

---

### 3. .env File Permissions (1 minute)

```bash
# Find insecure .env files
find ~/development -name ".env*" -type f -perm 644 2>/dev/null
```

**Expected:** No output (all files should be 600)

**Fix:**
```bash
find ~/development -name ".env*" -type f -exec chmod 600 {} \;
```

---

### 4. Screen Lock (30 seconds)

- [ ] Is your screen set to lock automatically?
- [ ] Does it require password immediately?

**macOS:** System Settings > Lock Screen
**Windows:** Settings > Accounts > Sign-in options
**Linux:** Settings > Privacy > Screen Lock

---

### 5. Recent Downloads (2 minutes)

Check your Downloads folder for:
- [ ] Unexpected executables
- [ ] Suspicious installers
- [ ] Files you don't remember downloading

```bash
# List recent downloads (macOS/Linux)
ls -lt ~/Downloads | head -10
```

---

## Quick Fix Commands

### Enable Firewall (macOS)
```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
```

### Secure .env Files
```bash
find ~/development -name ".env*" -exec chmod 600 {} \;
```

### Secure SSH Keys
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
```

---

## Pass/Fail Summary

| Check | Pass | Fail |
|-------|------|------|
| Firewall enabled | | |
| No dangerous ports exposed | | |
| .env files secured | | |
| Screen lock enabled | | |
| Downloads folder clean | | |

**Result:** ___/5 passed

- 5/5: Excellent
- 4/5: Good, fix the one issue
- 3/5: Action needed today
- <3/5: Stop and fix now

---

## What's Next?

If you have more time, run the full audit:
```bash
./scripts/macos/full-audit.sh
```
