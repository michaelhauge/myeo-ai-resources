#!/usr/bin/env python3
"""
SMB Security Audit Tool
Interactive security assessment tool that generates a scored report.
Based on the 50-question assessment from guides/01-assessment.md

Usage:
    python3 security-audit.py
    python3 security-audit.py --output report.txt

Requirements:
    Python 3.7+ (no external dependencies)
"""

import sys
import os
from datetime import datetime
from typing import List, Dict, Tuple

# ANSI color codes for terminal output
class Colors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'

def print_header(text: str):
    """Print formatted header"""
    print(f"\n{Colors.BOLD}{Colors.BLUE}{'='*70}{Colors.ENDC}")
    print(f"{Colors.BOLD}{Colors.BLUE}{text}{Colors.ENDC}")
    print(f"{Colors.BOLD}{Colors.BLUE}{'='*70}{Colors.ENDC}\n")

def print_section(text: str):
    """Print section header"""
    print(f"\n{Colors.BOLD}{Colors.CYAN}{text}{Colors.ENDC}\n")

def print_score(score: int, max_score: int):
    """Print colored score based on value"""
    percentage = (score / max_score * 100) if max_score > 0 else 0
    if percentage >= 80:
        color = Colors.GREEN
    elif percentage >= 60:
        color = Colors.YELLOW
    else:
        color = Colors.RED
    print(f"{color}{score}/{max_score} points ({percentage:.1f}%){Colors.ENDC}")

# Security assessment questions
# Format: (question, points_full, points_partial, category)
QUESTIONS = [
    # Category 1: Passwords & Access Control (20 points)
    ("Do you use a password manager for all work passwords?", 6, 3, "Passwords & Access"),
    ("Is MFA enabled on your email accounts (Gmail, Outlook)?", 4, 0, "Passwords & Access"),
    ("Is MFA enabled on financial accounts (banking, payment processors)?", 4, 0, "Passwords & Access"),
    ("Do you use unique passwords for each account (no password reuse)?", 3, 0, "Passwords & Access"),
    ("Are shared accounts (like info@company.com) minimized or eliminated?", 3, 2, "Passwords & Access"),

    # Category 2: Email Security (15 points)
    ("Do you have email filtering enabled (spam, malware, phishing)?", 4, 0, "Email Security"),
    ("Is DMARC configured for your domain to prevent email spoofing?", 4, 0, "Email Security"),
    ("Have employees completed phishing awareness training in the past 12 months?", 4, 0, "Email Security"),
    ("Do you run phishing simulations to test employee awareness?", 3, 0, "Email Security"),

    # Category 3: Device Security (15 points)
    ("Is antivirus/endpoint protection installed on all devices?", 4, 0, "Device Security"),
    ("Is full disk encryption enabled on all laptops (FileVault/BitLocker)?", 4, 0, "Device Security"),
    ("Are automatic software updates enabled on all devices?", 3, 0, "Device Security"),
    ("Are devices configured to auto-lock after 5-15 minutes of inactivity?", 2, 0, "Device Security"),
    ("Do you have a Mobile Device Management (MDM) solution for remote wipe capability?", 2, 0, "Device Security"),

    # Category 4: Network Security (10 points)
    ("Is your office Wi-Fi using WPA3 or WPA2 encryption (not WPA or Open)?", 3, 0, "Network Security"),
    ("Do you have a separate guest Wi-Fi network (isolated from main network)?", 2, 0, "Network Security"),
    ("Is a VPN required when employees connect from public Wi-Fi?", 3, 0, "Network Security"),
    ("Have you changed default passwords on routers and network equipment?", 2, 0, "Network Security"),

    # Category 5: Backup & Recovery (15 points)
    ("Do you have automated daily backups of critical data?", 4, 0, "Backup & Recovery"),
    ("Are backups stored offsite or in a separate cloud account (not just local)?", 4, 0, "Backup & Recovery"),
    ("Have you successfully tested restoring from backups in the past 6 months?", 4, 0, "Backup & Recovery"),
    ("Do you have a documented disaster recovery plan with RTO/RPO defined?", 3, 0, "Backup & Recovery"),

    # Category 6: Cloud Security (15 points)
    ("Is MFA enforced for all users on cloud services (Google Workspace, Microsoft 365)?", 4, 0, "Cloud Security"),
    ("Are external file sharing permissions restricted (not 'Anyone with the link')?", 3, 0, "Cloud Security"),
    ("Do you have Data Loss Prevention (DLP) rules to prevent sensitive data sharing?", 3, 2, "Cloud Security"),
    ("Do you conduct monthly audits of cloud admin accounts and permissions?", 3, 0, "Cloud Security"),
    ("Have you reviewed and approved all third-party apps with access to cloud data?", 2, 0, "Cloud Security"),

    # Category 7: Security Policies (5 points)
    ("Do you have a written security policy that employees have acknowledged?", 3, 0, "Security Policies"),
    ("Do employees receive security training during onboarding?", 2, 0, "Security Policies"),

    # Category 8: Incident Response (5 points)
    ("Do you have a documented incident response plan with clear roles?", 3, 0, "Incident Response"),
    ("Do you have cyber insurance coverage?", 2, 0, "Incident Response"),
]

def ask_question(question: str, points_full: int, points_partial: int) -> Tuple[int, str]:
    """
    Ask a yes/no/partial question and return points earned
    Returns: (points, answer)
    """
    options_text = "([Y]es / [N]o"
    if points_partial > 0:
        options_text += " / [P]artial"
    options_text += "): "

    print(f"{question}")
    print(f"   {Colors.CYAN}Full points: {points_full}, Partial: {points_partial if points_partial > 0 else 'N/A'}{Colors.ENDC}")

    while True:
        answer = input(f"   {options_text}").strip().upper()

        if answer in ['Y', 'YES']:
            return points_full, 'Yes'
        elif answer in ['N', 'NO']:
            return 0, 'No'
        elif answer in ['P', 'PARTIAL'] and points_partial > 0:
            return points_partial, 'Partial'
        else:
            if points_partial > 0:
                print(f"   {Colors.RED}Please enter Y, N, or P{Colors.ENDC}")
            else:
                print(f"   {Colors.RED}Please enter Y or N{Colors.ENDC}")

def calculate_category_scores(answers: List[Dict]) -> Dict[str, Dict]:
    """Calculate scores by category"""
    categories = {}

    for answer in answers:
        category = answer['category']
        if category not in categories:
            categories[category] = {
                'score': 0,
                'max_score': 0,
                'questions': []
            }

        categories[category]['score'] += answer['points_earned']
        categories[category]['max_score'] += answer['points_full']
        categories[category]['questions'].append(answer)

    return categories

def get_recommendations(categories: Dict[str, Dict]) -> List[str]:
    """Generate recommendations based on scores"""
    recommendations = []

    for category, data in categories.items():
        percentage = (data['score'] / data['max_score'] * 100) if data['max_score'] > 0 else 0

        # High priority (score < 60%)
        if percentage < 60:
            # Find the worst questions in this category
            weak_questions = [q for q in data['questions'] if q['points_earned'] == 0]
            if weak_questions:
                recommendations.append({
                    'priority': 'HIGH',
                    'category': category,
                    'percentage': percentage,
                    'weak_count': len(weak_questions)
                })

    return sorted(recommendations, key=lambda x: x['percentage'])

def generate_report(answers: List[Dict], categories: Dict[str, Dict],
                   total_score: int, max_score: int, output_file: str = None):
    """Generate and print/save the assessment report"""

    report_lines = []

    def add_line(line: str = ""):
        report_lines.append(line)
        if not output_file:
            print(line)

    # Header
    add_line("\n" + "="*70)
    add_line("SMB SECURITY AUDIT REPORT")
    add_line("="*70)
    add_line(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    add_line()

    # Overall Score
    add_line("OVERALL SECURITY SCORE")
    add_line("-"*70)
    percentage = (total_score / max_score * 100) if max_score > 0 else 0
    add_line(f"Score: {total_score}/{max_score} points ({percentage:.1f}%)")
    add_line()

    if percentage >= 80:
        rating = "EXCELLENT"
        interpretation = "Your security posture is strong. Focus on maintaining current practices and continuous improvement."
    elif percentage >= 60:
        rating = "GOOD"
        interpretation = "Your security is adequate but has gaps. Prioritize improvements in low-scoring categories."
    elif percentage >= 40:
        rating = "NEEDS WORK"
        interpretation = "Your security has significant gaps. Immediate action required to reduce risk."
    else:
        rating = "CRITICAL"
        interpretation = "Your security is inadequate. You are at high risk of breach. Urgent action required."

    add_line(f"Rating: {rating}")
    add_line(f"Interpretation: {interpretation}")
    add_line()

    # Category Breakdown
    add_line("CATEGORY BREAKDOWN")
    add_line("-"*70)

    for category, data in sorted(categories.items(), key=lambda x: x[1]['score']/x[1]['max_score']):
        cat_percentage = (data['score'] / data['max_score'] * 100) if data['max_score'] > 0 else 0
        add_line(f"{category:30} {data['score']:2}/{data['max_score']:2} ({cat_percentage:5.1f}%)")
    add_line()

    # Top Priority Improvements
    add_line("TOP PRIORITY IMPROVEMENTS")
    add_line("-"*70)

    recommendations = get_recommendations(categories)

    if recommendations:
        for i, rec in enumerate(recommendations[:5], 1):  # Top 5
            add_line(f"{i}. {rec['category']}: {rec['weak_count']} critical gaps ({rec['percentage']:.1f}% score)")
    else:
        add_line("No critical gaps identified. Continue monitoring and improvement.")
    add_line()

    # Detailed Results
    add_line("DETAILED RESULTS BY CATEGORY")
    add_line("-"*70)

    for category in sorted(categories.keys()):
        add_line()
        add_line(f"{category}")
        add_line("~" * len(category))

        for q in categories[category]['questions']:
            status = "✓" if q['points_earned'] == q['points_full'] else "✗" if q['points_earned'] == 0 else "~"
            add_line(f"  {status} {q['question']}")
            add_line(f"     Answer: {q['answer']}, Points: {q['points_earned']}/{q['points_full']}")

    add_line()

    # Next Steps
    add_line("RECOMMENDED NEXT STEPS")
    add_line("-"*70)

    if percentage < 40:
        add_line("1. URGENT: Implement password manager + MFA (Guide 02)")
        add_line("2. URGENT: Set up daily backups with offsite storage (Guide 06)")
        add_line("3. HIGH: Deploy endpoint protection on all devices (Guide 04)")
        add_line("4. HIGH: Configure email filtering and DMARC (Guide 03)")
        add_line("5. MEDIUM: Create incident response plan (Guide 08)")
    elif percentage < 60:
        add_line("1. Address all 'No' answers in low-scoring categories")
        add_line("2. Implement DLP rules for cloud services (Guide 07)")
        add_line("3. Set up monthly security audits (Guide 07)")
        add_line("4. Deploy phishing simulations (Guide 03)")
        add_line("5. Test backup restores (Guide 06)")
    elif percentage < 80:
        add_line("1. Convert all 'Partial' answers to 'Yes'")
        add_line("2. Implement remaining MFA enforcement (Guide 02)")
        add_line("3. Set up automated security monitoring")
        add_line("4. Conduct quarterly security training")
        add_line("5. Consider SOC 2 compliance (if applicable)")
    else:
        add_line("1. Maintain current security practices")
        add_line("2. Conduct quarterly audits (re-run this tool)")
        add_line("3. Stay updated on emerging threats")
        add_line("4. Test incident response plan (tabletop exercises)")
        add_line("5. Consider advanced security (penetration testing, SIEM)")

    add_line()
    add_line("="*70)
    add_line("For detailed guidance, see: SMB Cybersecurity Guide")
    add_line("Repository: myeo-ai-resources/smb-cybersecurity-guide")
    add_line("="*70)

    # Save to file if requested
    if output_file:
        try:
            with open(output_file, 'w') as f:
                f.write('\n'.join(report_lines))
            print(f"\n{Colors.GREEN}Report saved to: {output_file}{Colors.ENDC}")
        except IOError as e:
            print(f"\n{Colors.RED}Error saving report: {e}{Colors.ENDC}")

def main():
    """Main function to run the security audit"""

    # Parse command line arguments
    output_file = None
    if len(sys.argv) > 1:
        if sys.argv[1] in ['-h', '--help']:
            print("SMB Security Audit Tool")
            print()
            print("Usage:")
            print("  python3 security-audit.py              # Interactive audit")
            print("  python3 security-audit.py --output FILE # Save report to file")
            print()
            print("This tool runs through 50 security questions across 8 categories")
            print("and generates a scored report with recommendations.")
            sys.exit(0)
        elif sys.argv[1] in ['-o', '--output']:
            if len(sys.argv) > 2:
                output_file = sys.argv[2]
            else:
                print(f"{Colors.RED}Error: --output requires a filename{Colors.ENDC}")
                sys.exit(1)

    # Welcome
    print_header("SMB SECURITY AUDIT TOOL")
    print("This interactive assessment will evaluate your company's security posture.")
    print("Answer honestly - this helps identify areas for improvement.")
    print()
    print(f"Total questions: {len(QUESTIONS)}")
    print(f"Maximum score: {sum(q[1] for q in QUESTIONS)} points")
    print()
    input("Press Enter to begin...")

    # Run assessment
    answers = []
    current_category = None

    for question, points_full, points_partial, category in QUESTIONS:
        # Print category header when it changes
        if category != current_category:
            print_section(f"Category: {category}")
            current_category = category

        points_earned, answer = ask_question(question, points_full, points_partial)

        answers.append({
            'question': question,
            'answer': answer,
            'points_earned': points_earned,
            'points_full': points_full,
            'category': category
        })
        print()  # Blank line between questions

    # Calculate scores
    total_score = sum(a['points_earned'] for a in answers)
    max_score = sum(a['points_full'] for a in answers)
    categories = calculate_category_scores(answers)

    # Generate report
    print_header("GENERATING REPORT...")
    generate_report(answers, categories, total_score, max_score, output_file)

    print()
    print(f"{Colors.GREEN}Assessment complete!{Colors.ENDC}")
    print()

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n\n{Colors.YELLOW}Assessment cancelled by user.{Colors.ENDC}")
        sys.exit(0)
    except Exception as e:
        print(f"\n{Colors.RED}Error: {e}{Colors.ENDC}")
        sys.exit(1)
