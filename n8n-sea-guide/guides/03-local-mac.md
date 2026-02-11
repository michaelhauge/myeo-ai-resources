# Install n8n on Local Mac

**Run n8n on your Mac in 10 minutes**

---

## Overview

Running n8n locally on your Mac is the fastest way to:
- Test n8n before committing to VPS
- Learn workflow automation
- Run internal automations (no external access needed)
- Maximum privacy (data stays on your Mac)

**Cost**: $0
**Time**: 10 minutes
**Difficulty**: Beginner

---

## Prerequisites

Before starting, ensure:
- [ ] Docker Desktop installed and running
- [ ] Mac has at least 4GB RAM available
- [ ] 10GB disk space free

**Need Docker?** → [Prerequisites Guide](01-prerequisites.md)

---

## Installation Methods

### Method 1: Quick Start (Simplest)

**One-command installation**:
```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  n8nio/n8n
```

**What this does**:
- Downloads n8n Docker image
- Starts n8n on port 5678
- Opens in interactive mode

**Access n8n**:
1. Wait for "Editor is now accessible via" message
2. Open browser: http://localhost:5678
3. Create your first account

**Limitations**:
- ❌ Data lost when container stops
- ❌ Not persistent (for testing only)
- ❌ No custom configuration

**When to use**: Quick test, one-time workflows

---

### Method 2: Persistent Setup (Recommended)

**For production use** with data persistence.

#### Step 1: Create Project Folder

```bash
# Create directory for n8n
mkdir -p ~/n8n-local
cd ~/n8n-local
```

#### Step 2: Create docker-compose.yml

```bash
# Create docker-compose file
cat > docker-compose.yml << 'EOF'
services:
  n8n:
    image: n8nio/n8n
    container_name: n8n
    restart: always
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=change-this-password
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - GENERIC_TIMEZONE=Asia/Singapore
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data:
    driver: local
EOF
```

#### Step 3: Customize Configuration

**Edit the file**:
```bash
open docker-compose.yml
# Or: nano docker-compose.yml
```

**Change these values**:
```yaml
N8N_BASIC_AUTH_USER=your-username
N8N_BASIC_AUTH_PASSWORD=your-secure-password
GENERIC_TIMEZONE=Asia/Singapore  # Or Asia/Kuala_Lumpur
```

**Password requirements**:
- At least 8 characters
- Mix of letters and numbers
- Avoid common words

#### Step 4: Start n8n

```bash
# Start n8n
docker-compose up -d

# Check if running
docker ps
```

**Expected output**:
```
CONTAINER ID   IMAGE        STATUS         PORTS
abc123def456   n8nio/n8n    Up 10 seconds  0.0.0.0:5678->5678/tcp
```

#### Step 5: Access n8n

1. Open browser: http://localhost:5678
2. Enter credentials (username/password from docker-compose.yml)
3. You're in!

---

### Method 3: With PostgreSQL Database (Production-Grade)

**For serious production use** with better performance.

#### Step 1: Create docker-compose.yml with PostgreSQL

```bash
cd ~/n8n-local

cat > docker-compose.yml << 'EOF'
services:
  postgres:
    image: postgres:15
    container_name: n8n-postgres
    restart: always
    environment:
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=n8n-db-password
      - POSTGRES_DB=n8n
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U n8n"]
      interval: 5s
      timeout: 5s
      retries: 5

  n8n:
    image: n8nio/n8n
    container_name: n8n
    restart: always
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=change-this-password
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=n8n-db-password
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - GENERIC_TIMEZONE=Asia/Singapore
    volumes:
      - n8n_data:/home/node/.n8n
    depends_on:
      postgres:
        condition: service_healthy

volumes:
  n8n_data:
    driver: local
  postgres_data:
    driver: local
EOF
```

#### Step 2: Customize and Start

```bash
# Edit passwords
open docker-compose.yml

# Start both containers
docker-compose up -d

# Check both running
docker ps
```

---

## Managing n8n

### Start n8n

```bash
cd ~/n8n-local
docker-compose up -d
```

**Expected**: "Container n8n Started"

---

### Stop n8n

```bash
cd ~/n8n-local
docker-compose down
```

**Note**: Data persists in Docker volumes.

---

### Restart n8n

```bash
cd ~/n8n-local
docker-compose restart
```

---

### View Logs

```bash
# Real-time logs
docker logs -f n8n

# Last 100 lines
docker logs --tail 100 n8n

# Exit logs: Ctrl+C
```

---

### Update n8n

```bash
cd ~/n8n-local

# Stop current version
docker-compose down

# Pull latest image
docker-compose pull

# Start with new version
docker-compose up -d

# Verify version
docker exec n8n n8n --version
```

---

## First-Time Setup

### Create Your Account

1. Open http://localhost:5678
2. **First visit**: Enter username and password from docker-compose.yml
3. You'll see the n8n welcome screen

### Set Up Your Profile

1. Click profile icon (top right)
2. **Settings** → **Personal**
3. Add:
   - Full name
   - Email (for notifications)
   - Timezone (Asia/Singapore or Asia/Kuala_Lumpur)

---

## Configuration Options

### Environment Variables You Can Customize

Add to `environment:` section in docker-compose.yml:

#### Timezone
```yaml
GENERIC_TIMEZONE=Asia/Singapore
# Or: Asia/Kuala_Lumpur, Asia/Jakarta
```

#### Execution Data Retention
```yaml
EXECUTIONS_DATA_MAX_AGE=168  # Hours (7 days)
# Keep execution history for debugging
```

#### Workflow Timeout
```yaml
EXECUTIONS_TIMEOUT=300  # Seconds (5 minutes)
# Prevent runaway workflows
```

#### Webhook URL (if exposing externally)
```yaml
WEBHOOK_URL=http://your-public-ip:5678
# For external webhook triggers
```

---

## Accessing from Other Devices on Your Network

### Step 1: Find Your Mac's Local IP

```bash
# Get local IP address
ipconfig getifaddr en0
# Example output: 192.168.1.100
```

### Step 2: Update docker-compose.yml

```yaml
environment:
  - N8N_HOST=192.168.1.100  # Your Mac's IP
```

### Step 3: Restart n8n

```bash
docker-compose restart
```

### Step 4: Access from Other Devices

From phone, tablet, or other computer on same network:
```
http://192.168.1.100:5678
```

---

## Backups

### Manual Backup

```bash
# Export all workflows
docker exec n8n n8n export:workflow --all --output=/data/backup.json

# Copy from container to Mac
docker cp n8n:/data/backup.json ~/n8n-backups/backup-$(date +%Y%m%d).json

# Backup database (if using PostgreSQL)
docker exec n8n-postgres pg_dump -U n8n n8n > ~/n8n-backups/db-backup-$(date +%Y%m%d).sql
```

### Automated Daily Backups

**Create backup script**:
```bash
cat > ~/n8n-backup.sh << 'EOF'
#!/bin/bash
BACKUP_DIR=~/n8n-backups
DATE=$(date +%Y%m%d)

# Create backup directory
mkdir -p $BACKUP_DIR

# Export workflows
docker exec n8n n8n export:workflow --all --output=/data/backup.json
docker cp n8n:/data/backup.json $BACKUP_DIR/workflows-$DATE.json

# Backup database (if using PostgreSQL)
docker exec n8n-postgres pg_dump -U n8n n8n > $BACKUP_DIR/db-$DATE.sql

# Keep only last 7 days
find $BACKUP_DIR -name "*.json" -mtime +7 -delete
find $BACKUP_DIR -name "*.sql" -mtime +7 -delete

echo "Backup completed: $DATE"
EOF

chmod +x ~/n8n-backup.sh
```

**Schedule with cron**:
```bash
# Open crontab
crontab -e

# Add this line (runs daily at 2 AM)
0 2 * * * ~/n8n-backup.sh >> ~/n8n-backups/backup.log 2>&1
```

---

## Troubleshooting

### "Cannot connect to localhost:5678"

**Check if n8n is running**:
```bash
docker ps
# Should show n8n container with STATUS: Up
```

**If not running**:
```bash
cd ~/n8n-local
docker-compose up -d
```

**Check logs for errors**:
```bash
docker logs n8n
```

---

### "Port 5678 is already in use"

**Find what's using port 5678**:
```bash
lsof -i :5678
```

**Kill the process**:
```bash
kill -9 [PID]
```

**Or use different port** in docker-compose.yml:
```yaml
ports:
  - "8080:5678"  # Access at localhost:8080
```

---

### "Cannot authenticate / Invalid credentials"

**Reset password**:
```bash
# Stop n8n
docker-compose down

# Edit docker-compose.yml
open docker-compose.yml

# Change password
N8N_BASIC_AUTH_PASSWORD=new-password

# Start n8n
docker-compose up -d
```

---

### "Workflows not persisting after restart"

**Check if using volumes**:
```bash
docker volume ls
# Should show: n8n_data (and postgres_data if using PostgreSQL)
```

**If missing**, you used Method 1 (non-persistent). Switch to Method 2.

---

### "Docker Desktop using too much resources"

**Limit resources**:
1. Docker Desktop → Preferences → Resources
2. Set limits:
   - **CPUs**: 2-4
   - **Memory**: 4-6GB
   - **Swap**: 1GB

---

## Security Best Practices

### 1. Change Default Password

**Never use**:
- "admin" / "password"
- "n8n" / "n8n"
- Company name / Your name

**Use strong password**:
- 12+ characters
- Mix of upper/lowercase/numbers/symbols
- Password manager generated

---

### 2. Don't Expose to Internet Without HTTPS

**Local Mac = Safe**:
- Only accessible on your network
- No external access by default

**If exposing externally**:
- Use VPN (Tailscale, Cloudflare Tunnel)
- Or set up HTTPS with domain + Caddy

---

### 3. Regular Updates

```bash
# Monthly update routine
cd ~/n8n-local
docker-compose down
docker-compose pull
docker-compose up -d
```

---

## Next Steps

### Create Your First Workflow

→ [First Workflow Guide](07-first-workflow.md)

**Recommended first workflows**:
1. Email notification when Google Form submitted
2. Daily summary from Google Calendar
3. WhatsApp reminder from calendar events

---

### Add Integrations

→ [WhatsApp Integration](08-whatsapp-integration.md)
→ [Telegram Integration](09-telegram-integration.md)

---

### Migrate to VPS (Optional)

When ready for 24/7 operation:
→ [Oracle Cloud Free](04-oracle-cloud-free.md) ($0/month)
→ [Contabo VPS](06-contabo-vps.md) ($5.50/month)

**Export workflows from local**:
```bash
# Export all workflows
docker exec n8n n8n export:workflow --all --output=/data/export.json

# Copy to Mac
docker cp n8n:/data/export.json ~/Desktop/workflows-export.json
```

**Import on VPS**: Upload file and import in n8n UI.

---

## Uninstalling n8n

### Complete Removal

```bash
# Stop and remove containers
cd ~/n8n-local
docker-compose down

# Remove volumes (deletes all data!)
docker volume rm n8n_data postgres_data

# Remove images
docker rmi n8nio/n8n postgres:15

# Remove project folder
rm -rf ~/n8n-local
```

**Warning**: This deletes all workflows and data. Export first!

---

**Ready to build workflows? → [First Workflow Guide](07-first-workflow.md)**
