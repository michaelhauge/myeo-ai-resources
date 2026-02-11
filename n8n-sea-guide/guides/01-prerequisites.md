# Prerequisites: Getting Ready for n8n

**What you need before installing n8n**

---

## Overview

Before installing n8n, you'll need:

1. **Docker** (for running n8n)
2. **VPS Account** (optional, for cloud hosting)
3. **Basic understanding** of terminals/command line

**Time required**: 15-30 minutes

---

## Step 1: Install Docker

n8n runs in a Docker container, which makes installation clean and consistent across different systems.

### For Mac Users

#### Option 1: Docker Desktop (Recommended)

**Download and Install**:
1. Visit: https://www.docker.com/products/docker-desktop
2. Click "Download for Mac"
3. Choose:
   - **Apple Silicon (M1/M2/M3)**: ARM version
   - **Intel Mac**: Intel version
4. Open downloaded `.dmg` file
5. Drag Docker icon to Applications folder
6. Launch Docker Desktop from Applications
7. Accept terms and conditions
8. Wait for Docker to start (whale icon in menu bar)

**Verify Installation**:
```bash
docker --version
# Should show: Docker version 24.0.x or higher

docker-compose --version
# Should show: Docker Compose version 2.x.x
```

**Resource Settings**:
1. Click Docker whale icon → Preferences
2. Go to Resources
3. Recommended settings:
   - **CPUs**: 2 minimum, 4 recommended
   - **Memory**: 4GB minimum, 8GB recommended
   - **Disk**: 20GB minimum

---

#### Option 2: Homebrew (Advanced)

**Install via Homebrew**:
```bash
# Install Docker
brew install --cask docker

# Start Docker
open /Applications/Docker.app
```

---

### For Windows Users

**Download and Install**:
1. Visit: https://www.docker.com/products/docker-desktop
2. Click "Download for Windows"
3. Run installer
4. Enable WSL 2 (Windows Subsystem for Linux) if prompted
5. Restart computer if required
6. Launch Docker Desktop
7. Wait for Docker engine to start

**Verify Installation**:
```bash
docker --version
docker-compose --version
```

---

### For Linux Users (Ubuntu/Debian)

**Install Docker Engine**:
```bash
# Update package index
sudo apt-get update

# Install prerequisites
sudo apt-get install ca-certificates curl gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to docker group (avoid sudo)
sudo usermod -aG docker $USER
newgrp docker
```

**Verify Installation**:
```bash
docker --version
docker compose version  # Note: 'compose' not 'docker-compose' on newer versions
```

---

## Step 2: Understanding Docker Basics

You don't need to be a Docker expert, but understanding these concepts helps:

### What is Docker?

Docker packages software into "containers" - self-contained environments with everything needed to run the application.

**Benefits**:
- Clean installation (doesn't mess with your system)
- Consistent (works same on Mac/Windows/Linux)
- Easy updates (just pull new container)
- Easy uninstall (just delete container)

### Basic Docker Commands You'll Use

```bash
# See running containers
docker ps

# See all containers (including stopped)
docker ps -a

# Stop a container
docker stop container_name

# Start a container
docker start container_name

# Remove a container
docker rm container_name

# See Docker images
docker images

# Remove an image
docker rmi image_name

# View container logs
docker logs container_name

# Access container shell
docker exec -it container_name /bin/sh
```

**Don't worry** - the installation guides provide exact commands to copy/paste.

---

## Step 3: Choose Your Hosting Option

### Option A: Local Mac/PC (Free, Easiest to Start)

**Pros**:
- $0 cost
- Maximum privacy
- Instant setup
- Perfect for learning/testing

**Cons**:
- Computer must stay on for scheduled workflows
- Not accessible from outside your network
- Limited by computer resources

**Best for**:
- Testing n8n before committing
- Personal use
- Internal company automations

**Next**: [Local Mac Installation](03-local-mac.md)

---

### Option B: Oracle Cloud Free Tier (Free Forever)

**Pros**:
- $0 cost forever
- 4 OCPU, 24GB RAM (generous!)
- Singapore datacenter available
- Professional hosting infrastructure

**Cons**:
- Requires credit card verification (no charges)
- ARM architecture (minor)
- Competitive to get instance (high demand)
- Can be deleted if idle >30 days

**Best for**:
- Budget-conscious businesses
- Production use at $0 cost
- Those comfortable with VPS setup

**Next**: [Oracle Cloud Free Guide](04-oracle-cloud-free.md)

---

### Option C: Contabo VPS (~$5.50/month, Best Value)

**Pros**:
- Excellent specs for price (4 vCPU, 8GB RAM)
- Singapore datacenter
- Unlimited bandwidth
- x86 architecture (full compatibility)

**Cons**:
- Not free ($5.50/month)
- Requires manual setup
- You manage updates

**Best for**:
- Production use on budget
- Businesses wanting best value
- Long-term hosting

**Next**: [Contabo VPS Guide](06-contabo-vps.md)

---

### Option D: DigitalOcean ($24/month, Easiest VPS)

**Pros**:
- Excellent documentation
- Singapore datacenter
- Great support
- Easy 1-click apps

**Cons**:
- Higher cost ($24/month for suitable specs)
- Smaller specs than Contabo for price

**Best for**:
- Non-technical users wanting managed VPS
- Businesses valuing support and ease-of-use
- Those new to VPS hosting

**Next**: [DigitalOcean Guide](05-digitalocean.md)

---

### Option E: n8n Cloud (€24/month, Zero Setup)

**Pros**:
- Zero server management
- Automatic updates
- Professional support
- SOC 2 certified

**Cons**:
- Monthly cost (€24 = ~$26 USD)
- Execution limits (2,500/month on Starter)
- Data not in SEA (Frankfurt/US)

**Best for**:
- Non-technical teams
- "Just make it work" approach
- Need professional support

**Next**: Sign up at https://n8n.io

---

## Step 4: (Optional) Create VPS Account

If choosing Oracle, Contabo, or DigitalOcean, create your account now:

### Oracle Cloud

1. Visit: https://www.oracle.com/cloud/free/
2. Click "Start for Free"
3. Fill in details:
   - Country: Singapore or Malaysia
   - Email and password
   - Cloud account name (unique, lowercase)
4. **Payment verification**:
   - Requires credit card
   - $0 charge (just verification)
   - $1-2 temporary hold (refunded)
5. Complete registration
6. Verify email

**Important**: Choose Singapore region during setup for data localization.

---

### Contabo

1. Visit: https://contabo.com/en-us/vps-singapore/
2. Select "Cloud VPS 10" (4 vCPU, 8GB RAM, ~$5.50/month)
3. Choose Singapore datacenter
4. Configure:
   - Storage: 75GB NVMe (included)
   - Image: Ubuntu 22.04
   - Period: Monthly
5. Create account
6. Complete payment
7. Wait for server provisioning email (5-30 minutes)

---

### DigitalOcean

1. Visit: https://www.digitalocean.com
2. Click "Sign Up"
3. Create account (email or GitHub/Google)
4. **Billing**:
   - Add credit card or PayPal
   - $200 free credit for 60 days (new users)
5. Verify email
6. Set up billing alerts: $10/month recommended

---

## Step 5: Prepare for Installation

### Create a Project Folder (Optional)

For organization:
```bash
# Create folder for n8n files
mkdir ~/n8n-setup
cd ~/n8n-setup
```

---

### Install Text Editor (if needed)

**For Mac**:
- VSCode: https://code.visualstudio.com (recommended)
- Sublime Text: https://www.sublimetext.com
- TextEdit (built-in) works fine

**For Windows**:
- VSCode: https://code.visualstudio.com (recommended)
- Notepad++ https://notepad-plus-plus.org

**You'll need this for**:
- Editing docker-compose.yml
- Editing .env files
- Viewing logs

---

### Open Terminal/Command Prompt

**Mac**:
- Spotlight Search (Cmd+Space) → type "Terminal"
- Or: Applications → Utilities → Terminal

**Windows**:
- Windows Key → type "cmd" → Command Prompt
- Or: Windows PowerShell (recommended)

**Linux**:
- Ctrl+Alt+T (Ubuntu)
- Or search "Terminal" in applications

---

## Understanding Key Concepts

### Environment Variables

Environment variables store configuration (like passwords) outside your code.

**Example**:
```bash
# Instead of hardcoding:
password: "mysecretpassword123"

# Use environment variable:
password: ${N8N_PASSWORD}
```

**Stored in**: `.env` file

---

### Ports

n8n runs on port 5678 by default.

**What this means**:
- Local access: http://localhost:5678
- VPS access: http://your-server-ip:5678

**Firewall note**: Port must be open for external access.

---

### Docker Compose

`docker-compose.yml` is a configuration file that defines:
- Which Docker images to use
- How to configure n8n
- What databases to connect
- Which ports to expose

**You don't write it from scratch** - copy from templates in this guide.

---

## Checklist Before Installation

- [ ] Docker installed and running
- [ ] Can run `docker --version` successfully
- [ ] Decided on hosting option (Local, Oracle, Contabo, or DigitalOcean)
- [ ] VPS account created (if using VPS)
- [ ] Text editor installed
- [ ] Terminal/Command Prompt open
- [ ] Basic understanding of concepts above

---

## Troubleshooting

### "Docker command not found"

**Mac/Linux**:
```bash
# Check if Docker is in PATH
which docker

# If not found, Docker Desktop may not be running
# Start Docker Desktop application
```

**Windows**:
- Ensure Docker Desktop is running (check system tray)
- Restart computer after installation

---

### "Cannot connect to Docker daemon"

**All platforms**:
- Docker Desktop must be running
- Check Docker icon in taskbar/menu bar
- Try restarting Docker Desktop

**Linux**:
```bash
# Start Docker service
sudo systemctl start docker

# Check status
sudo systemctl status docker
```

---

### "Permission denied" (Linux)

```bash
# Add your user to docker group
sudo usermod -aG docker $USER

# Log out and log back in
# OR run:
newgrp docker
```

---

## Next Steps

Choose your installation path:

**Beginners / Testing**:
→ [Install on Local Mac](03-local-mac.md) (10 minutes, $0)

**Budget-Conscious / Production**:
→ [Oracle Cloud Free](04-oracle-cloud-free.md) (30 minutes, $0)
→ [Contabo VPS](06-contabo-vps.md) (30 minutes, $5.50/month)

**Ease-of-Use / Support**:
→ [DigitalOcean](05-digitalocean.md) (20 minutes, $24/month)

**Zero Technical Setup**:
→ Sign up for n8n Cloud (5 minutes, €24/month)

---

**Ready? Pick your path and get started!**
