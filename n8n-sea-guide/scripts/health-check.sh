#!/bin/bash

#############################################
# n8n Health Check Script
# Verifies installation and configuration
#############################################

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Counters
PASS=0
WARN=0
FAIL=0

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  n8n Health Check                      ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check 1: Docker installed and running
echo -n "1. Docker installed and running... "
if command -v docker &> /dev/null && docker ps &> /dev/null; then
    echo -e "${GREEN}✓ PASS${NC}"
    ((PASS++))
else
    echo -e "${RED}✗ FAIL${NC}"
    echo "   Docker is not installed or not running"
    ((FAIL++))
fi

# Check 2: n8n container running
echo -n "2. n8n container running... "
if docker ps | grep -q "n8n"; then
    echo -e "${GREEN}✓ PASS${NC}"
    ((PASS++))
else
    echo -e "${RED}✗ FAIL${NC}"
    echo "   n8n container is not running"
    echo "   Start with: docker-compose up -d"
    ((FAIL++))
fi

# Check 3: PostgreSQL container running (if exists)
echo -n "3. PostgreSQL container... "
if docker ps -a | grep -q "postgres"; then
    if docker ps | grep -q "postgres"; then
        echo -e "${GREEN}✓ PASS${NC}"
        ((PASS++))
    else
        echo -e "${RED}✗ FAIL${NC}"
        echo "   PostgreSQL container exists but not running"
        ((FAIL++))
    fi
else
    echo -e "${YELLOW}⚠ SKIP${NC} (using SQLite)"
    ((WARN++))
fi

# Check 4: n8n port accessible
echo -n "4. n8n port 5678 accessible... "
if command -v curl &> /dev/null; then
    if curl -s -o /dev/null -w "%{http_code}" http://localhost:5678 | grep -q "200\|401"; then
        echo -e "${GREEN}✓ PASS${NC}"
        ((PASS++))
    else
        echo -e "${RED}✗ FAIL${NC}"
        echo "   Cannot connect to localhost:5678"
        ((FAIL++))
    fi
else
    if nc -z localhost 5678 2>/dev/null; then
        echo -e "${GREEN}✓ PASS${NC}"
        ((PASS++))
    else
        echo -e "${RED}✗ FAIL${NC}"
        echo "   Port 5678 not responding"
        ((FAIL++))
    fi
fi

# Check 5: Disk space
echo -n "5. Disk space available... "
DISK_USAGE=$(df -h . | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -lt 90 ]; then
    echo -e "${GREEN}✓ PASS${NC} (${DISK_USAGE}% used)"
    ((PASS++))
elif [ "$DISK_USAGE" -lt 95 ]; then
    echo -e "${YELLOW}⚠ WARN${NC} (${DISK_USAGE}% used)"
    echo "   Consider freeing up disk space"
    ((WARN++))
else
    echo -e "${RED}✗ FAIL${NC} (${DISK_USAGE}% used)"
    echo "   Low disk space may cause issues"
    ((FAIL++))
fi

# Check 6: Docker volumes exist
echo -n "6. Docker volumes present... "
VOLUMES=$(docker volume ls | grep -c "n8n")
if [ "$VOLUMES" -gt 0 ]; then
    echo -e "${GREEN}✓ PASS${NC} (${VOLUMES} volumes)"
    ((PASS++))
else
    echo -e "${YELLOW}⚠ WARN${NC}"
    echo "   No n8n volumes found (non-persistent setup?)"
    ((WARN++))
fi

# Check 7: n8n container health
echo -n "7. n8n container healthy... "
if docker ps --filter "name=n8n" --filter "status=running" | grep -q "n8n"; then
    UPTIME=$(docker ps --filter "name=n8n" --format "{{.Status}}" | grep -o "Up.*")
    echo -e "${GREEN}✓ PASS${NC} (${UPTIME})"
    ((PASS++))
else
    echo -e "${RED}✗ FAIL${NC}"
    ((FAIL++))
fi

# Check 8: Recent errors in logs
echo -n "8. Checking for errors in logs... "
ERRORS=$(docker logs n8n 2>&1 | tail -50 | grep -ic "error\|fatal\|exception" || echo 0)
if [ "$ERRORS" -eq 0 ]; then
    echo -e "${GREEN}✓ PASS${NC} (no recent errors)"
    ((PASS++))
elif [ "$ERRORS" -lt 5 ]; then
    echo -e "${YELLOW}⚠ WARN${NC} ($ERRORS errors found)"
    echo "   Check logs: docker logs n8n"
    ((WARN++))
else
    echo -e "${RED}✗ FAIL${NC} ($ERRORS errors found)"
    echo "   Check logs: docker logs n8n"
    ((FAIL++))
fi

# Summary
echo ""
echo "═══════════════════════════════════════"
echo "Summary:"
echo "═══════════════════════════════════════"
echo -e "${GREEN}✓ Passed:${NC} $PASS"
echo -e "${YELLOW}⚠ Warnings:${NC} $WARN"
echo -e "${RED}✗ Failed:${NC} $FAIL"
echo ""

if [ "$FAIL" -eq 0 ] && [ "$WARN" -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC} n8n is healthy."
elif [ "$FAIL" -eq 0 ]; then
    echo -e "${YELLOW}⚠ n8n is running but has warnings${NC}"
    echo "Review warnings above and consider addressing them"
else
    echo -e "${RED}✗ n8n has issues that need attention${NC}"
    echo ""
    echo "Troubleshooting steps:"
    echo "  1. Check logs: docker logs n8n"
    echo "  2. Restart n8n: docker-compose restart"
    echo "  3. Check docker-compose.yml configuration"
    echo "  4. Visit: https://docs.n8n.io/hosting/installation/docker/"
fi

echo ""

# Exit with appropriate code
if [ "$FAIL" -gt 0 ]; then
    exit 1
elif [ "$WARN" -gt 0 ]; then
    exit 2
else
    exit 0
fi
