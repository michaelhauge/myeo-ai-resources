#!/usr/bin/env python3
"""
SaaS Renewal Tracker
Sends email reminders for upcoming SaaS renewals (60 days before renewal)

Usage:
    python renewal-tracker.py --calendar path/to/renewal-calendar.csv --email your@email.com

Requirements:
    pip install pandas python-dateutil

Setup:
    1. Fill out renewal-calendar.csv with your SaaS renewal dates
    2. Configure email settings (SMTP server, credentials)
    3. Run monthly via cron job or GitHub Actions

Example cron job (1st of every month at 9am):
    0 9 1 * * cd /path/to/scripts && python3 renewal-tracker.py --calendar ../templates/renewal-calendar.csv --email cfo@company.com
"""

import argparse
import csv
import smtplib
from datetime import datetime, timedelta
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from pathlib import Path
from typing import List, Dict

# Email configuration (update these for your SMTP server)
SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 587
SMTP_USERNAME = "your-email@gmail.com"  # Update this
SMTP_PASSWORD = "your-app-password"     # Update this (use app password, not regular password)
FROM_EMAIL = "your-email@gmail.com"     # Update this


def load_renewal_calendar(csv_path: Path) -> List[Dict]:
    """Load renewal calendar from CSV file."""
    renewals = []

    with open(csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Skip empty rows
            if not row.get('Tool Name'):
                continue

            renewals.append({
                'tool_name': row['Tool Name'],
                'vendor': row['Vendor'],
                'monthly_cost': row['Monthly Cost'],
                'annual_cost': row['Annual Cost'],
                'renewal_date': row['Renewal Date'],
                'contract_length': row['Contract Length'],
                'owner': row['Owner'],
                'notes': row.get('Notes', '')
            })

    return renewals


def parse_date(date_str: str) -> datetime:
    """Parse date string in format YYYY-MM-DD or MM/DD/YYYY."""
    # Try multiple date formats
    formats = ['%Y-%m-%d', '%m/%d/%Y', '%m/%d/%y']

    for fmt in formats:
        try:
            return datetime.strptime(date_str, fmt)
        except ValueError:
            continue

    raise ValueError(f"Could not parse date: {date_str}")


def find_upcoming_renewals(renewals: List[Dict], days_ahead: int = 60) -> List[Dict]:
    """Find renewals happening within next N days."""
    today = datetime.now()
    target_date = today + timedelta(days=days_ahead)

    upcoming = []

    for renewal in renewals:
        try:
            renewal_date = parse_date(renewal['renewal_date'])

            # Check if renewal is within the next N days
            if today <= renewal_date <= target_date:
                days_until = (renewal_date - today).days
                renewal['days_until'] = days_until
                renewal['parsed_date'] = renewal_date
                upcoming.append(renewal)
        except ValueError as e:
            print(f"Warning: Could not parse date for {renewal['tool_name']}: {e}")
            continue

    # Sort by days until renewal (soonest first)
    upcoming.sort(key=lambda x: x['days_until'])

    return upcoming


def format_renewal_email(renewals: List[Dict]) -> str:
    """Format upcoming renewals into HTML email."""

    if not renewals:
        return """
        <html>
        <body>
            <h2>SaaS Renewal Tracker</h2>
            <p>No upcoming renewals in the next 60 days.</p>
            <p>All clear! ✓</p>
        </body>
        </html>
        """

    # Group by urgency
    urgent = [r for r in renewals if r['days_until'] <= 30]
    upcoming = [r for r in renewals if 30 < r['days_until'] <= 60]

    html = """
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; }
            h2 { color: #1e3a5f; }
            h3 { color: #0d9488; margin-top: 20px; }
            table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
            th { background-color: #1e3a5f; color: white; padding: 10px; text-align: left; }
            td { padding: 8px; border-bottom: 1px solid #ddd; }
            .urgent { background-color: #fee2e2; }
            .upcoming { background-color: #fef3c7; }
            .action { font-weight: bold; color: #dc2626; }
        </style>
    </head>
    <body>
        <h2>🔔 SaaS Renewal Tracker - Action Required</h2>
        <p><strong>Date:</strong> {today}</p>
    """.format(today=datetime.now().strftime('%B %d, %Y'))

    if urgent:
        html += """
        <h3>⚠️ Urgent - Renewals in Next 30 Days</h3>
        <table>
            <tr>
                <th>Tool</th>
                <th>Vendor</th>
                <th>Renewal Date</th>
                <th>Days Until</th>
                <th>Annual Cost</th>
                <th>Owner</th>
                <th>Action</th>
            </tr>
        """

        for r in urgent:
            html += """
            <tr class="urgent">
                <td>{tool}</td>
                <td>{vendor}</td>
                <td>{date}</td>
                <td><strong>{days} days</strong></td>
                <td>{cost}</td>
                <td>{owner}</td>
                <td class="action">Start negotiation NOW</td>
            </tr>
            """.format(
                tool=r['tool_name'],
                vendor=r['vendor'],
                date=r['parsed_date'].strftime('%Y-%m-%d'),
                days=r['days_until'],
                cost=r['annual_cost'],
                owner=r['owner']
            )

        html += "</table>"

    if upcoming:
        html += """
        <h3>📅 Upcoming - Renewals in 31-60 Days</h3>
        <table>
            <tr>
                <th>Tool</th>
                <th>Vendor</th>
                <th>Renewal Date</th>
                <th>Days Until</th>
                <th>Annual Cost</th>
                <th>Owner</th>
                <th>Action</th>
            </tr>
        """

        for r in upcoming:
            html += """
            <tr class="upcoming">
                <td>{tool}</td>
                <td>{vendor}</td>
                <td>{date}</td>
                <td>{days} days</td>
                <td>{cost}</td>
                <td>{owner}</td>
                <td>Plan negotiation</td>
            </tr>
            """.format(
                tool=r['tool_name'],
                vendor=r['vendor'],
                date=r['parsed_date'].strftime('%Y-%m-%d'),
                days=r['days_until'],
                cost=r['annual_cost'],
                owner=r['owner']
            )

        html += "</table>"

    # Add negotiation tips
    html += """
        <h3>💡 Negotiation Tips</h3>
        <ul>
            <li><strong>Start early:</strong> Begin negotiations 60 days before renewal for best results</li>
            <li><strong>Get competitive quotes:</strong> Research alternatives to use as leverage</li>
            <li><strong>Multi-year discounts:</strong> Offer 2-3 year commitment for 15-25% off</li>
            <li><strong>Quarter-end timing:</strong> Vendors more flexible in last 2 weeks of quarter</li>
            <li><strong>Ask for manager:</strong> Account reps have limited discount authority</li>
        </ul>

        <h3>📚 Resources</h3>
        <ul>
            <li><a href="../NEGOTIATION.md">Negotiation Playbook</a> - Tactics and strategies</li>
            <li><a href="../templates/negotiation-emails.md">Email Templates</a> - Ready-to-send emails</li>
            <li><a href="../ALTERNATIVES.md">Tool Alternatives</a> - Competitive pricing data</li>
        </ul>

        <p><em>This email was automatically generated by renewal-tracker.py</em></p>
    </body>
    </html>
    """

    return html


def send_email(to_email: str, subject: str, html_content: str):
    """Send HTML email via SMTP."""

    msg = MIMEMultipart('alternative')
    msg['Subject'] = subject
    msg['From'] = FROM_EMAIL
    msg['To'] = to_email

    # Attach HTML content
    html_part = MIMEText(html_content, 'html')
    msg.attach(html_part)

    # Send email
    try:
        with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
            server.starttls()
            server.login(SMTP_USERNAME, SMTP_PASSWORD)
            server.send_message(msg)

        print(f"✓ Email sent to {to_email}")
    except Exception as e:
        print(f"✗ Failed to send email: {e}")
        raise


def main():
    parser = argparse.ArgumentParser(
        description="Track SaaS renewals and send email reminders"
    )
    parser.add_argument(
        '--calendar',
        type=Path,
        required=True,
        help='Path to renewal-calendar.csv'
    )
    parser.add_argument(
        '--email',
        type=str,
        required=True,
        help='Email address to send reminders to'
    )
    parser.add_argument(
        '--days',
        type=int,
        default=60,
        help='Number of days ahead to check (default: 60)'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Print email content without sending'
    )

    args = parser.parse_args()

    # Validate calendar file exists
    if not args.calendar.exists():
        print(f"Error: Calendar file not found: {args.calendar}")
        return 1

    # Load renewals
    print(f"Loading renewal calendar from {args.calendar}...")
    renewals = load_renewal_calendar(args.calendar)
    print(f"Loaded {len(renewals)} renewals")

    # Find upcoming renewals
    print(f"Checking for renewals in next {args.days} days...")
    upcoming = find_upcoming_renewals(renewals, days_ahead=args.days)
    print(f"Found {len(upcoming)} upcoming renewals")

    if upcoming:
        for r in upcoming:
            print(f"  - {r['tool_name']}: {r['days_until']} days until renewal")

    # Format email
    html_content = format_renewal_email(upcoming)

    # Send or display email
    if args.dry_run:
        print("\n" + "="*80)
        print("DRY RUN - Email content (HTML):")
        print("="*80)
        print(html_content)
        print("="*80)
    else:
        subject = f"SaaS Renewal Alert - {len(upcoming)} renewals in next {args.days} days"
        send_email(args.email, subject, html_content)

    return 0


if __name__ == '__main__':
    exit(main())
