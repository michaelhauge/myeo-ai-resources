#!/usr/bin/env python3
"""
Claude Code Skill Security Scanner
-----------------------------------
Scans Claude Code skills for security red flags and malicious patterns.

Usage:
    python3 skill-scanner.py /path/to/skill/directory
    python3 skill-scanner.py ~/.claude/skills/my-skill/

Output:
    - Risk score (LOW/MEDIUM/HIGH/CRITICAL)
    - Detailed findings with line numbers
    - Summary of suspicious patterns found

Exit codes:
    0 = No issues found (LOW risk)
    1 = Warnings found (MEDIUM risk)
    2 = Critical issues found (HIGH/CRITICAL risk)
    3 = Scan error (invalid path, permission denied, etc.)
"""

import os
import sys
import re
import argparse
from pathlib import Path
from typing import List, Dict, Tuple
from dataclasses import dataclass
from enum import Enum

class RiskLevel(Enum):
    """Risk severity levels"""
    LOW = 0
    MEDIUM = 1
    HIGH = 2
    CRITICAL = 3

@dataclass
class Finding:
    """Security finding with context"""
    risk: RiskLevel
    category: str
    description: str
    file_path: str
    line_number: int = None
    line_content: str = None
    recommendation: str = None

class SkillScanner:
    """Scans Claude Code skills for security issues"""

    # Suspicious patterns to search for
    CRITICAL_PATTERNS = {
        r'rm\s+-rf\s+/': 'Destructive file deletion (root directory)',
        r'rm\s+-rf\s+~': 'Destructive file deletion (home directory)',
        r'rm\s+-rf\s+\$HOME': 'Destructive file deletion (home directory)',
        r'curl\s+.*\|\s*bash': 'Pipe curl to bash (code execution)',
        r'wget\s+.*\|\s*bash': 'Pipe wget to bash (code execution)',
        r'curl\s+.*\|\s*sh': 'Pipe curl to shell (code execution)',
        r'eval\s*\(': 'eval() call (arbitrary code execution)',
        r'exec\s*\(': 'exec() call (arbitrary code execution)',
        r'__import__\s*\(': 'Dynamic import (code injection risk)',
        r'base64\s+.*\|\s*bash': 'Base64 encoded command execution',
        r'nc\s+-e': 'Netcat reverse shell',
        r'/dev/tcp/': 'TCP backdoor',
        r'mkfifo': 'Named pipe (backdoor mechanism)',
        r'nohup\s+.*&': 'Background process (persistence)',
    }

    HIGH_RISK_PATTERNS = {
        r'curl\s+http://': 'HTTP download (unencrypted, MITM risk)',
        r'wget\s+http://': 'HTTP download (unencrypted, MITM risk)',
        r'chmod\s+777': 'Overly permissive file permissions',
        r'chmod\s+\+x\s+/tmp': 'Making temp files executable (malware pattern)',
        r'crontab\s+-': 'Cron job modification (persistence)',
        r'LaunchAgents': 'macOS persistence mechanism',
        r'\.ssh/authorized_keys': 'SSH key manipulation',
        r'\.aws/credentials': 'AWS credentials access',
        r'\.env': 'Environment file access (may contain secrets)',
        r'process\.env\[': 'Environment variable access',
        r'os\.environ\[': 'Environment variable access',
        r'sudo\s+': 'Privilege escalation attempt',
    }

    MEDIUM_RISK_PATTERNS = {
        r'git\s+clone': 'Cloning repositories (supply chain risk)',
        r'npm\s+install': 'Installing npm packages (dependency risk)',
        r'pip\s+install': 'Installing pip packages (dependency risk)',
        r'docker\s+run': 'Running Docker containers',
        r'requests\.get\s*\(': 'Network request (data exfiltration risk)',
        r'urllib\.request': 'Network request (data exfiltration risk)',
        r'socket\.': 'Direct socket usage (network communication)',
        r'subprocess\.': 'Subprocess execution',
        r'os\.system\s*\(': 'Shell command execution',
        r'shutil\.rmtree': 'Directory deletion',
    }

    # Suspicious network destinations
    SUSPICIOUS_DOMAINS = [
        r'\.ru/',  # Russian domains
        r'\.cn/',  # Chinese domains
        r'pastebin\.com',
        r'hastebin\.com',
        r'transfer\.sh',
        r'0x0\.st',
        r'ngrok\.io',  # Tunneling service
        r'localhost\.run',  # Tunneling service
    ]

    def __init__(self, skill_path: str):
        """Initialize scanner with skill directory path"""
        self.skill_path = Path(skill_path)
        self.findings: List[Finding] = []

        if not self.skill_path.exists():
            raise FileNotFoundError(f"Skill path not found: {skill_path}")

        if not self.skill_path.is_dir():
            raise NotADirectoryError(f"Path is not a directory: {skill_path}")

    def scan(self) -> Tuple[RiskLevel, List[Finding]]:
        """Run all security scans and return overall risk level"""
        print(f"🔍 Scanning: {self.skill_path}")
        print("=" * 70)

        # Check directory structure
        self._check_structure()

        # Scan SKILL.md
        skill_md = self.skill_path / "SKILL.md"
        if skill_md.exists():
            self._scan_file(skill_md)
        else:
            self.findings.append(Finding(
                risk=RiskLevel.MEDIUM,
                category="Structure",
                description="No SKILL.md file found (unusual)",
                file_path=str(self.skill_path),
                recommendation="Verify this is a valid Claude Code skill"
            ))

        # Scan scripts directory
        scripts_dir = self.skill_path / "scripts"
        if scripts_dir.exists():
            self._scan_scripts_directory(scripts_dir)

        # Check for binary files
        self._check_binaries()

        # Calculate overall risk
        overall_risk = self._calculate_risk()

        return overall_risk, self.findings

    def _check_structure(self):
        """Check directory structure for anomalies"""
        # Check size
        total_size = sum(f.stat().st_size for f in self.skill_path.rglob('*') if f.is_file())
        if total_size > 1_000_000:  # 1 MB
            self.findings.append(Finding(
                risk=RiskLevel.MEDIUM,
                category="Size",
                description=f"Large skill size: {total_size / 1024:.1f} KB (typical is <100 KB)",
                file_path=str(self.skill_path),
                recommendation="Verify all files are necessary. Large skills may hide malware."
            ))

        # Count files
        file_count = len(list(self.skill_path.rglob('*')))
        if file_count > 10:
            self.findings.append(Finding(
                risk=RiskLevel.LOW,
                category="Complexity",
                description=f"{file_count} files (typical is 1-3)",
                file_path=str(self.skill_path),
                recommendation="Review why so many files are needed"
            ))

    def _check_binaries(self):
        """Check for binary/executable files"""
        binary_extensions = {'.exe', '.dmg', '.bin', '.so', '.dll', '.dylib', '.app'}

        for file_path in self.skill_path.rglob('*'):
            if file_path.is_file():
                # Check extension
                if file_path.suffix.lower() in binary_extensions:
                    self.findings.append(Finding(
                        risk=RiskLevel.CRITICAL,
                        category="Binary File",
                        description=f"Binary file detected: {file_path.name}",
                        file_path=str(file_path),
                        recommendation="REJECT - Skills should not contain binary executables"
                    ))

                # Check if file is executable (Unix)
                if os.name != 'nt' and os.access(file_path, os.X_OK):
                    if file_path.suffix not in {'.sh', '.py', '.js'}:  # Scripts are OK
                        self.findings.append(Finding(
                            risk=RiskLevel.HIGH,
                            category="Executable",
                            description=f"Unexpected executable file: {file_path.name}",
                            file_path=str(file_path),
                            recommendation="Investigate why this file is executable"
                        ))

    def _scan_file(self, file_path: Path):
        """Scan a single file for suspicious patterns"""
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                lines = f.readlines()

            for line_num, line in enumerate(lines, start=1):
                # Check critical patterns
                for pattern, description in self.CRITICAL_PATTERNS.items():
                    if re.search(pattern, line, re.IGNORECASE):
                        self.findings.append(Finding(
                            risk=RiskLevel.CRITICAL,
                            category="Critical Pattern",
                            description=description,
                            file_path=str(file_path.relative_to(self.skill_path)),
                            line_number=line_num,
                            line_content=line.strip(),
                            recommendation="REJECT - This pattern is extremely dangerous"
                        ))

                # Check high-risk patterns
                for pattern, description in self.HIGH_RISK_PATTERNS.items():
                    if re.search(pattern, line, re.IGNORECASE):
                        self.findings.append(Finding(
                            risk=RiskLevel.HIGH,
                            category="High Risk Pattern",
                            description=description,
                            file_path=str(file_path.relative_to(self.skill_path)),
                            line_number=line_num,
                            line_content=line.strip(),
                            recommendation="Verify this is necessary for skill functionality"
                        ))

                # Check medium-risk patterns
                for pattern, description in self.MEDIUM_RISK_PATTERNS.items():
                    if re.search(pattern, line, re.IGNORECASE):
                        self.findings.append(Finding(
                            risk=RiskLevel.MEDIUM,
                            category="Medium Risk Pattern",
                            description=description,
                            file_path=str(file_path.relative_to(self.skill_path)),
                            line_number=line_num,
                            line_content=line.strip(),
                            recommendation="Review for necessity and safety"
                        ))

                # Check for suspicious domains
                for domain_pattern in self.SUSPICIOUS_DOMAINS:
                    if re.search(domain_pattern, line, re.IGNORECASE):
                        self.findings.append(Finding(
                            risk=RiskLevel.HIGH,
                            category="Suspicious Domain",
                            description=f"Connection to potentially malicious domain",
                            file_path=str(file_path.relative_to(self.skill_path)),
                            line_number=line_num,
                            line_content=line.strip(),
                            recommendation="Verify the destination is trustworthy"
                        ))

        except Exception as e:
            self.findings.append(Finding(
                risk=RiskLevel.LOW,
                category="Scan Error",
                description=f"Could not scan file: {e}",
                file_path=str(file_path.relative_to(self.skill_path)),
                recommendation="Manual review required"
            ))

    def _scan_scripts_directory(self, scripts_dir: Path):
        """Scan all files in scripts/ directory"""
        for script_file in scripts_dir.rglob('*'):
            if script_file.is_file():
                self._scan_file(script_file)

    def _calculate_risk(self) -> RiskLevel:
        """Calculate overall risk level from findings"""
        if not self.findings:
            return RiskLevel.LOW

        # If any CRITICAL finding, overall is CRITICAL
        if any(f.risk == RiskLevel.CRITICAL for f in self.findings):
            return RiskLevel.CRITICAL

        # If 3+ HIGH findings, escalate to CRITICAL
        high_count = sum(1 for f in self.findings if f.risk == RiskLevel.HIGH)
        if high_count >= 3:
            return RiskLevel.CRITICAL

        # If any HIGH finding, overall is HIGH
        if any(f.risk == RiskLevel.HIGH for f in self.findings):
            return RiskLevel.HIGH

        # If 5+ MEDIUM findings, escalate to HIGH
        medium_count = sum(1 for f in self.findings if f.risk == RiskLevel.MEDIUM)
        if medium_count >= 5:
            return RiskLevel.HIGH

        # If any MEDIUM finding, overall is MEDIUM
        if any(f.risk == RiskLevel.MEDIUM for f in self.findings):
            return RiskLevel.MEDIUM

        return RiskLevel.LOW

    def print_report(self, overall_risk: RiskLevel):
        """Print formatted scan report"""
        # Risk level header
        risk_colors = {
            RiskLevel.LOW: "\033[92m",      # Green
            RiskLevel.MEDIUM: "\033[93m",   # Yellow
            RiskLevel.HIGH: "\033[91m",     # Red
            RiskLevel.CRITICAL: "\033[95m", # Magenta
        }
        risk_symbols = {
            RiskLevel.LOW: "✅",
            RiskLevel.MEDIUM: "⚠️",
            RiskLevel.HIGH: "❌",
            RiskLevel.CRITICAL: "🚨",
        }
        reset = "\033[0m"

        print(f"\n{risk_colors[overall_risk]}{'=' * 70}{reset}")
        print(f"{risk_colors[overall_risk]}{risk_symbols[overall_risk]} Overall Risk: {overall_risk.name}{reset}")
        print(f"{risk_colors[overall_risk]}{'=' * 70}{reset}\n")

        if not self.findings:
            print("✅ No security issues found!")
            print("\nThis skill appears safe, but always:")
            print("  • Review the code manually")
            print("  • Check the author's reputation")
            print("  • Verify the source (official/OpenClaw/GitHub)")
            print("  • Test in a safe environment first")
            return

        # Group findings by risk level
        findings_by_risk = {
            RiskLevel.CRITICAL: [],
            RiskLevel.HIGH: [],
            RiskLevel.MEDIUM: [],
            RiskLevel.LOW: [],
        }

        for finding in self.findings:
            findings_by_risk[finding.risk].append(finding)

        # Print findings by severity
        for risk_level in [RiskLevel.CRITICAL, RiskLevel.HIGH, RiskLevel.MEDIUM, RiskLevel.LOW]:
            findings = findings_by_risk[risk_level]
            if not findings:
                continue

            print(f"{risk_colors[risk_level]}{risk_symbols[risk_level]} {risk_level.name} ({len(findings)}){reset}")
            print("-" * 70)

            for i, finding in enumerate(findings, 1):
                print(f"\n{i}. {finding.category}: {finding.description}")
                print(f"   File: {finding.file_path}")
                if finding.line_number:
                    print(f"   Line {finding.line_number}: {finding.line_content}")
                if finding.recommendation:
                    print(f"   💡 {finding.recommendation}")

            print()

        # Summary and recommendations
        print("=" * 70)
        print("SUMMARY")
        print("=" * 70)

        critical_count = len(findings_by_risk[RiskLevel.CRITICAL])
        high_count = len(findings_by_risk[RiskLevel.HIGH])
        medium_count = len(findings_by_risk[RiskLevel.MEDIUM])
        low_count = len(findings_by_risk[RiskLevel.LOW])

        print(f"🚨 Critical: {critical_count}")
        print(f"❌ High:     {high_count}")
        print(f"⚠️  Medium:  {medium_count}")
        print(f"ℹ️  Low:     {low_count}")
        print()

        # Recommendations
        if overall_risk == RiskLevel.CRITICAL:
            print("🚨 RECOMMENDATION: REJECT THIS SKILL")
            print("   Critical security issues found. Do not install.")
        elif overall_risk == RiskLevel.HIGH:
            print("❌ RECOMMENDATION: REJECT OR ESCALATE TO SECURITY EXPERT")
            print("   Significant security concerns. Requires expert review.")
        elif overall_risk == RiskLevel.MEDIUM:
            print("⚠️  RECOMMENDATION: APPROVE WITH CAUTION")
            print("   Review findings carefully. Consider 'On Click Only' mode.")
            print("   Only install if you trust the source and understand the risks.")
        else:
            print("✅ RECOMMENDATION: APPROVE")
            print("   No major security issues found, but always verify source and author.")

        print()
        print("Next steps:")
        print("  • Review all flagged lines manually")
        print("  • Check author reputation on GitHub")
        print("  • Search for security reports: Google \"[skill name] security\"")
        print("  • If approved, test in isolated environment first")

def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description="Scan Claude Code skills for security issues",
        epilog="Example: python3 skill-scanner.py ~/.claude/skills/my-skill/"
    )
    parser.add_argument(
        "skill_path",
        help="Path to skill directory (e.g., ~/.claude/skills/skill-name/)"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Show detailed output"
    )

    args = parser.parse_args()

    try:
        # Run scan
        scanner = SkillScanner(args.skill_path)
        overall_risk, findings = scanner.scan()

        # Print report
        scanner.print_report(overall_risk)

        # Exit code based on risk
        if overall_risk == RiskLevel.LOW:
            sys.exit(0)
        elif overall_risk == RiskLevel.MEDIUM:
            sys.exit(1)
        else:  # HIGH or CRITICAL
            sys.exit(2)

    except (FileNotFoundError, NotADirectoryError) as e:
        print(f"❌ Error: {e}", file=sys.stderr)
        sys.exit(3)
    except Exception as e:
        print(f"❌ Unexpected error: {e}", file=sys.stderr)
        import traceback
        if args.verbose:
            traceback.print_exc()
        sys.exit(3)

if __name__ == "__main__":
    main()
