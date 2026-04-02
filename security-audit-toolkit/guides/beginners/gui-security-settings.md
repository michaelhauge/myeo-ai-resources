# GUI Security Settings Guide

A visual guide to securing your computer without using the command line.

---

## macOS Security Settings

### 1. Enable the Firewall

**Why:** Blocks unauthorized incoming network connections.

**How:**
1. Open **System Settings** (Apple menu > System Settings)
2. Click **Network** in the sidebar
3. Click **Firewall**
4. Toggle **Firewall** to ON
5. Click **Options...**
6. Enable **"Enable stealth mode"** (hides your computer from network scans)

**What it looks like:**
- Firewall toggle should be blue/ON
- Stealth mode checkbox should be checked

---

### 2. Disable File Sharing (Unless Needed)

**Why:** File sharing allows others on your network to access your files.

**How:**
1. Open **System Settings**
2. Click **General** > **Sharing**
3. Find **File Sharing** in the list
4. Toggle it OFF (or click the "i" to restrict access)

**If you need File Sharing:**
1. Click the "i" next to File Sharing
2. Remove "Everyone" from the Users list
3. Only add specific users who need access
4. Never enable "Guest" access

---

### 3. Disable Screen Sharing (Unless Needed)

**Why:** Allows remote control of your computer.

**How:**
1. Open **System Settings** > **General** > **Sharing**
2. Find **Screen Sharing**
3. Toggle it OFF

**If you need Screen Sharing:**
- Only use it over a VPN (like Tailscale)
- Restrict to specific users

---

### 4. Enable FileVault (Disk Encryption)

**Why:** Encrypts your entire disk. If your computer is stolen, data can't be accessed.

**How:**
1. Open **System Settings**
2. Click **Privacy & Security**
3. Scroll down to **FileVault**
4. Click **Turn On FileVault**
5. Choose to store recovery key in iCloud or write it down
6. Keep the recovery key safe!

**Note:** This takes time and your Mac needs to be plugged in.

---

### 5. Set Up Screen Lock

**Why:** Prevents unauthorized access when you step away.

**How:**
1. Open **System Settings**
2. Click **Lock Screen**
3. Set **"Require password after screen saver begins or display is off"** to **Immediately**
4. Set **"Turn display off on battery/power"** to 5 minutes or less

**Quick lock shortcut:** Press `Cmd + Ctrl + Q`

---

### 6. Check Login Items

**Why:** Malware often adds itself to start automatically.

**How:**
1. Open **System Settings**
2. Click **General** > **Login Items**
3. Review the list of apps
4. Remove anything you don't recognize

---

## Windows Security Settings

### 1. Enable Windows Firewall

1. Open **Settings** > **Privacy & security** > **Windows Security**
2. Click **Firewall & network protection**
3. Make sure all network types show "Firewall is on"

### 2. Disable Unnecessary Sharing

1. Open **Settings** > **Network & internet** > **Advanced network settings**
2. Click **Advanced sharing settings**
3. Turn off file and printer sharing if not needed

### 3. Enable BitLocker (Disk Encryption)

1. Search for "BitLocker" in Start menu
2. Click **Turn on BitLocker**
3. Follow the prompts to encrypt your drive

### 4. Set Up Screen Lock

1. Open **Settings** > **Accounts** > **Sign-in options**
2. Under "Require sign-in", select **When PC wakes from sleep**
3. Set a PIN or password

---

## Linux Security Settings (Ubuntu/GNOME)

### 1. Enable Firewall

1. Open **Settings** > **Privacy** > **Firewall**
2. Toggle the firewall ON

Or use the terminal:
```bash
sudo ufw enable
```

### 2. Set Up Screen Lock

1. Open **Settings** > **Privacy** > **Screen Lock**
2. Enable **Automatic Screen Lock**
3. Set delay to 5 minutes or less

### 3. Disable Sharing Services

1. Open **Settings** > **Sharing**
2. Turn off any services you don't need

---

## What These Settings Protect Against

| Setting | Protects Against |
|---------|-----------------|
| Firewall | Hackers scanning your network |
| Disable File Sharing | Unauthorized file access |
| Disable Screen Sharing | Remote takeover of your computer |
| FileVault/BitLocker | Data theft if computer is stolen |
| Screen Lock | Someone using your computer when you're away |
| Review Login Items | Malware running at startup |

---

## Monthly Security Checklist

- [ ] Check that firewall is still enabled
- [ ] Review sharing settings
- [ ] Check for OS updates
- [ ] Review login items for anything suspicious
- [ ] Change passwords if you suspect any issues

---

## Getting Help

If you're unsure about a setting:
1. Take a screenshot before changing anything
2. Research the setting online
3. Ask a technically-minded friend
4. When in doubt, the more restrictive option is usually safer
