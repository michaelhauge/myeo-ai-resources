#!/usr/bin/env python3
"""
Timezone Overlap Calculator

Calculate overlapping working hours across multiple timezones.
Useful for scheduling meetings and determining core overlap hours for remote teams.

Usage:
    python timezone-overlap.py --timezones "Asia/Singapore,America/New_York" --work-hours 9-18

Requirements:
    pip install pytz
"""

import argparse
import sys
from datetime import datetime, timedelta
from typing import List, Tuple
try:
    import pytz
except ImportError:
    print("Error: pytz library not found.")
    print("Please install it with: pip install pytz")
    sys.exit(1)


def parse_work_hours(work_hours_str: str) -> Tuple[int, int]:
    """Parse work hours string like '9-18' into (start, end) tuple."""
    try:
        start, end = work_hours_str.split('-')
        start_hour = int(start)
        end_hour = int(end)

        if not (0 <= start_hour < 24 and 0 <= end_hour <= 24):
            raise ValueError("Hours must be between 0 and 24")
        if start_hour >= end_hour:
            raise ValueError("Start hour must be before end hour")

        return (start_hour, end_hour)
    except ValueError as e:
        print(f"Error parsing work hours '{work_hours_str}': {e}")
        print("Format should be 'START-END' (e.g., '9-18' for 9am-6pm)")
        sys.exit(1)


def get_timezone_name(tz_str: str) -> str:
    """Get timezone name from timezone string."""
    try:
        tz = pytz.timezone(tz_str)
        now = datetime.now(tz)
        return now.strftime('%Z (GMT%z)')
    except Exception:
        return tz_str


def calculate_overlap(timezones: List[str], work_start: int, work_end: int, reference_tz: str = None) -> dict:
    """
    Calculate overlapping hours across all timezones.

    Args:
        timezones: List of timezone strings (e.g., ['Asia/Singapore', 'America/New_York'])
        work_start: Start of work day in hours (24-hour format)
        work_end: End of work day in hours (24-hour format)
        reference_tz: Timezone to display results in (defaults to first timezone)

    Returns:
        Dict with overlap information
    """
    if not reference_tz:
        reference_tz = timezones[0]

    ref_tz = pytz.timezone(reference_tz)

    # Use a reference date (today)
    today = datetime.now(ref_tz).date()

    # Calculate working hours for each timezone in reference timezone
    all_work_periods = []

    for tz_str in timezones:
        try:
            tz = pytz.timezone(tz_str)
        except pytz.exceptions.UnknownTimeZoneError:
            print(f"Error: Unknown timezone '{tz_str}'")
            print(f"Run with --list to see available timezones")
            sys.exit(1)

        # Create work start and end times in this timezone
        work_start_local = tz.localize(datetime.combine(today, datetime.min.time().replace(hour=work_start)))
        work_end_local = tz.localize(datetime.combine(today, datetime.min.time().replace(hour=work_end)))

        # Convert to reference timezone
        work_start_ref = work_start_local.astimezone(ref_tz)
        work_end_ref = work_end_local.astimezone(ref_tz)

        all_work_periods.append((work_start_ref, work_end_ref, tz_str))

    # Find overlap (intersection of all periods)
    overlap_start = max(period[0] for period in all_work_periods)
    overlap_end = min(period[1] for period in all_work_periods)

    # Check if there's any overlap
    has_overlap = overlap_start < overlap_end

    if has_overlap:
        overlap_hours = (overlap_end - overlap_start).total_seconds() / 3600
    else:
        overlap_hours = 0

    return {
        'has_overlap': has_overlap,
        'overlap_start': overlap_start if has_overlap else None,
        'overlap_end': overlap_end if has_overlap else None,
        'overlap_hours': overlap_hours,
        'work_periods': all_work_periods,
        'reference_tz': reference_tz
    }


def format_time_12hr(dt: datetime) -> str:
    """Format datetime in 12-hour format."""
    return dt.strftime('%I:%M%p').lstrip('0')


def format_time_24hr(dt: datetime) -> str:
    """Format datetime in 24-hour format."""
    return dt.strftime('%H:%M')


def print_results(timezones: List[str], work_start: int, work_end: int, reference_tz: str = None, use_12hr: bool = False):
    """Print overlap calculation results."""
    result = calculate_overlap(timezones, work_start, work_end, reference_tz)

    format_time = format_time_12hr if use_12hr else format_time_24hr

    print("\n" + "="*60)
    print("TIMEZONE OVERLAP CALCULATOR")
    print("="*60)

    print(f"\n📍 Team Timezones ({len(timezones)}):")
    for tz_str in timezones:
        tz_name = get_timezone_name(tz_str)
        print(f"  • {tz_str} ({tz_name})")

    print(f"\n⏰ Working Hours: {work_start:02d}:00 - {work_end:02d}:00 (local time)")

    ref_tz_name = get_timezone_name(result['reference_tz'])
    print(f"\n🌍 Reference Timezone: {result['reference_tz']} ({ref_tz_name})")

    print(f"\n{'='*60}")

    if result['has_overlap']:
        print("✅ OVERLAP FOUND!")
        print(f"\n⏱️  Overlap Duration: {result['overlap_hours']:.1f} hours")
        print(f"\n📅 Overlap Period ({result['reference_tz']}):")
        print(f"   {format_time(result['overlap_start'])} - {format_time(result['overlap_end'])}")

        # Show overlap in all timezones
        print(f"\n🌐 Overlap in Each Timezone:")
        for tz_str in timezones:
            tz = pytz.timezone(tz_str)
            overlap_start_local = result['overlap_start'].astimezone(tz)
            overlap_end_local = result['overlap_end'].astimezone(tz)
            tz_name = get_timezone_name(tz_str)
            print(f"   • {tz_str}:")
            print(f"     {format_time(overlap_start_local)} - {format_time(overlap_end_local)} ({tz_name})")

        print(f"\n💡 Recommendation:")
        if result['overlap_hours'] >= 4:
            print(f"   ✅ Good overlap ({result['overlap_hours']:.1f} hours)")
            print(f"   Schedule synchronous meetings during this window.")
        elif result['overlap_hours'] >= 2:
            print(f"   ⚠️  Limited overlap ({result['overlap_hours']:.1f} hours)")
            print(f"   Use this window for critical sync meetings only.")
            print(f"   Default to async communication for most work.")
        else:
            print(f"   ⚠️  Minimal overlap ({result['overlap_hours']:.1f} hours)")
            print(f"   Consider async-first communication for this team.")
    else:
        print("❌ NO OVERLAP FOUND")
        print(f"\nThe team's working hours do not overlap.")
        print(f"\n💡 Recommendation:")
        print(f"   This team should work asynchronously (no real-time meetings).")
        print(f"   Use:")
        print(f"   • Loom videos for presentations")
        print(f"   • Written RFCs for decisions")
        print(f"   • Slack threads for discussions")
        print(f"   • Recorded meetings for async viewing")

        print(f"\n🕐 Working Hours by Timezone ({result['reference_tz']}):")
        for start, end, tz_str in result['work_periods']:
            print(f"   • {tz_str}:")
            print(f"     {format_time(start)} - {format_time(end)} ({result['reference_tz']})")

    print(f"\n{'='*60}\n")


def list_common_timezones():
    """Print list of common timezones."""
    common_timezones = {
        'Southeast Asia': [
            'Asia/Singapore',
            'Asia/Kuala_Lumpur',
            'Asia/Manila',
            'Asia/Bangkok',
            'Asia/Ho_Chi_Minh',
            'Asia/Jakarta',
        ],
        'East Asia': [
            'Asia/Hong_Kong',
            'Asia/Tokyo',
            'Asia/Seoul',
            'Asia/Shanghai',
        ],
        'South Asia': [
            'Asia/Kolkata',
            'Asia/Karachi',
            'Asia/Dhaka',
        ],
        'Australia': [
            'Australia/Sydney',
            'Australia/Melbourne',
            'Australia/Perth',
        ],
        'Europe': [
            'Europe/London',
            'Europe/Paris',
            'Europe/Berlin',
            'Europe/Amsterdam',
        ],
        'Americas - East': [
            'America/New_York',
            'America/Toronto',
            'America/Sao_Paulo',
        ],
        'Americas - Central': [
            'America/Chicago',
            'America/Mexico_City',
        ],
        'Americas - West': [
            'America/Los_Angeles',
            'America/Vancouver',
        ],
        'Middle East': [
            'Asia/Dubai',
            'Asia/Tehran',
            'Asia/Jerusalem',
        ],
        'Africa': [
            'Africa/Cairo',
            'Africa/Johannesburg',
            'Africa/Lagos',
        ],
    }

    print("\n" + "="*60)
    print("COMMON TIMEZONES")
    print("="*60)

    for region, tzs in common_timezones.items():
        print(f"\n{region}:")
        for tz in tzs:
            tz_name = get_timezone_name(tz)
            print(f"  • {tz:<30} {tz_name}")

    print(f"\n{'='*60}")
    print("For full list: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones")
    print("="*60 + "\n")


def main():
    parser = argparse.ArgumentParser(
        description='Calculate overlapping working hours across timezones',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Singapore and New York teams
  python timezone-overlap.py --timezones "Asia/Singapore,America/New_York" --work-hours 9-18

  # Multi-timezone team (SEA + US + Europe)
  python timezone-overlap.py --timezones "Asia/Singapore,America/Los_Angeles,Europe/London" --work-hours 9-17

  # Use different reference timezone
  python timezone-overlap.py --timezones "Asia/Singapore,Asia/Manila,Asia/Tokyo" --work-hours 9-18 --reference Asia/Singapore

  # List common timezones
  python timezone-overlap.py --list
        '''
    )

    parser.add_argument(
        '--timezones',
        type=str,
        help='Comma-separated list of timezones (e.g., "Asia/Singapore,America/New_York")'
    )

    parser.add_argument(
        '--work-hours',
        type=str,
        default='9-18',
        help='Working hours in 24-hour format (e.g., "9-18" for 9am-6pm). Default: 9-18'
    )

    parser.add_argument(
        '--reference',
        type=str,
        help='Reference timezone for displaying results (defaults to first timezone in list)'
    )

    parser.add_argument(
        '--12hr',
        action='store_true',
        help='Display times in 12-hour format (default: 24-hour)'
    )

    parser.add_argument(
        '--list',
        action='store_true',
        help='List common timezones'
    )

    args = parser.parse_args()

    if args.list:
        list_common_timezones()
        return

    if not args.timezones:
        parser.print_help()
        print("\nError: --timezones is required (unless using --list)")
        sys.exit(1)

    # Parse timezones
    timezones = [tz.strip() for tz in args.timezones.split(',')]

    if len(timezones) < 2:
        print("Error: At least 2 timezones required")
        sys.exit(1)

    # Parse work hours
    work_start, work_end = parse_work_hours(args.work_hours)

    # Calculate and print results
    print_results(
        timezones=timezones,
        work_start=work_start,
        work_end=work_end,
        reference_tz=args.reference,
        use_12hr=args.12hr
    )


if __name__ == '__main__':
    main()
