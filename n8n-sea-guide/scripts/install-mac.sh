#!/bin/bash

#############################################
# n8n One-Click Installer for Mac
# Installs Docker + n8n with PostgreSQL
#############################################

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  n8n One-Click Installer for Mac      ║"
echo "║  Southeast Asia Business Edition       ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check if Docker is installed
echo -e "${BLUE}Checking Docker installation...${NC}"
if ! command -v docker &> /dev/null; then
    echo -e "${RED}✗${NC} Docker not found"
    echo ""
    echo "Please install Docker Desktop first:"
    echo "1. Visit: https://www.docker.com/products/docker-desktop"
    echo "2. Download and install Docker Desktop for Mac"
    echo "3. Start Docker Desktop"
    echo "4. Run this script again"
    exit 1
fi

# Check if Docker is running
if ! docker ps &> /dev/null; then
    echo -e "${RED}✗${NC} Docker is not running"
    echo ""
    echo "Please start Docker Desktop and try again"
    exit 1
fi

echo -e "${GREEN}✓${NC} Docker is installed and running"

# Create project directory
echo ""
echo -e "${BLUE}Creating n8n directory...${NC}"
mkdir -p ~/n8n-setup
cd ~/n8n-setup

# Get user credentials
echo ""
echo -e "${BLUE}Setup n8n credentials${NC}"
echo ""
read -p "Enter admin username [default: admin]: " N8N_USER
N8N_USER=${N8N_USER:-admin}

while true; do
    read -sp "Enter admin password (min 8 characters): " N8N_PASSWORD
    echo ""
    if [ ${#N8N_PASSWORD} -lt 8 ]; then
        echo -e "${RED}Password must be at least 8 characters${NC}"
    else
        break
    fi
done

# Timezone selection
echo ""
echo -e "${BLUE}Select your timezone:${NC}"
echo "  1) Asia/Singapore (Singapore, Malaysia)"
echo "  2) Asia/Jakarta (Indonesia - WIB)"
echo "  3) Asia/Bangkok (Thailand, Vietnam)"
echo "  4) Asia/Manila (Philippines)"
echo ""
read -p "Enter choice [1-4, default 1]: " tz_choice
case ${tz_choice:-1} in
    1) TIMEZONE="Asia/Singapore" ;;
    2) TIMEZONE="Asia/Jakarta" ;;
    3) TIMEZONE="Asia/Bangkok" ;;
    4) TIMEZONE="Asia/Manila" ;;
    *) TIMEZONE="Asia/Singapore" ;;
esac
echo -e "${GREEN}✓${NC} Timezone: ${TIMEZONE}"

# PostgreSQL password
POSTGRES_PASSWORD=$(openssl rand -base64 16)

# Create docker-compose.yml
echo ""
echo -e "${BLUE}Creating configuration files...${NC}"

cat > docker-compose.yml << EOF
services:
  postgres:
    image: postgres:15
    container_name: n8n-postgres
    restart: always
    environment:
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
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
      - N8N_BASIC_AUTH_USER=${N8N_USER}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD}
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=${POSTGRES_PASSWORD}
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - GENERIC_TIMEZONE=\${TIMEZONE}
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

echo -e "${GREEN}✓${NC} Configuration created"

# Pull Docker images
echo ""
echo -e "${BLUE}Downloading n8n and PostgreSQL...${NC}"
docker-compose pull

# Start n8n
echo ""
echo -e "${BLUE}Starting n8n...${NC}"
docker-compose up -d

# Wait for n8n to be ready
echo ""
echo -e "${BLUE}Waiting for n8n to start...${NC}"
sleep 10

# Check if running
if docker ps | grep -q "n8n"; then
    echo -e "${GREEN}✓${NC} n8n is running!"
else
    echo -e "${RED}✗${NC} n8n failed to start"
    echo "Check logs with: docker logs n8n"
    exit 1
fi

# Success message
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  n8n Installation Complete! 🎉         ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}Access n8n at:${NC} http://localhost:5678"
echo ""
echo -e "${BLUE}Credentials:${NC}"
echo "  Username: ${N8N_USER}"
echo "  Password: (the password you entered during setup)"
echo ""
echo -e "${YELLOW}Important:${NC}"
echo "  • Save your credentials in a password manager (1Password, Bitwarden, etc.)"
echo "  • n8n runs in the background"
echo "  • To stop: cd ~/n8n-setup && docker-compose down"
echo "  • To restart: cd ~/n8n-setup && docker-compose up -d"
echo "  • To view logs: docker logs -f n8n"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo "  1. Open http://localhost:5678 in your browser"
echo "  2. Log in with the credentials above"
echo "  3. Build your first workflow!"
echo ""
echo "📚 Guides: https://github.com/michaelhauge/myeo-ai-resources/tree/main/n8n-sea-guide"
echo ""
