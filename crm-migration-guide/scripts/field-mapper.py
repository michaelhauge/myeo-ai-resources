#!/usr/bin/env python3
"""
CRM Field Mapping Tool
Maps fields from source CRM (HubSpot/Salesforce) to target CRM (Zoho/Freshsales/Pipedrive)

Features:
- Load field mapping template
- Generate mapping report for specific source → target combination
- Flag unmapped fields
- Suggest custom fields to create in target CRM

Usage:
    python3 field-mapper.py --source hubspot --target zoho
    python3 field-mapper.py --source salesforce --target freshsales
    python3 field-mapper.py --source hubspot --target pipedrive
"""

import sys
import pandas as pd
import argparse
from pathlib import Path


def load_field_mapping(template_path):
    """Load field mapping template CSV"""
    try:
        df = pd.read_csv(template_path)
        return df
    except FileNotFoundError:
        print(f"❌ Error: Field mapping template not found at {template_path}")
        print("Expected location: templates/field-mapping.csv")
        sys.exit(1)


def get_mappings(df, source_crm, target_crm):
    """Get field mappings for specific source → target combination"""
    # Normalize CRM names
    source_crm = source_crm.title()  # HubSpot, Salesforce
    target_crm = target_crm.title()  # Zoho CRM, Freshsales, Pipedrive

    # Map short names to full names in template
    crm_name_map = {
        'Hubspot': 'HubSpot',
        'Salesforce': 'Salesforce',
        'Zoho': 'Zoho CRM',
        'Freshsales': 'Freshsales',
        'Pipedrive': 'Pipedrive'
    }

    source_name = crm_name_map.get(source_crm, source_crm)
    target_name = crm_name_map.get(target_crm, target_crm)

    # Filter mappings
    mappings = df[
        (df['Source CRM'] == source_name) &
        (df['Target CRM'] == target_name)
    ]

    return mappings


def generate_report(mappings, source_crm, target_crm):
    """Generate field mapping report"""
    print(f"\n{'='*70}")
    print(f"FIELD MAPPING REPORT: {source_crm} → {target_crm}")
    print(f"{'='*70}\n")

    if len(mappings) == 0:
        print(f"❌ No mappings found for {source_crm} → {target_crm}")
        print("Available combinations:")
        print("  --source hubspot --target zoho")
        print("  --source hubspot --target freshsales")
        print("  --source hubspot --target pipedrive")
        print("  --source salesforce --target zoho")
        print("  --source salesforce --target freshsales")
        print("  --source salesforce --target pipedrive")
        return

    # Standard fields (exist in both CRMs)
    standard_fields = mappings[mappings['Notes'].str.contains('Standard field', case=False, na=False)]

    # Custom fields (need to be created)
    custom_fields = mappings[~mappings['Notes'].str.contains('Standard field', case=False, na=False)]

    # Required fields
    required_fields = mappings[mappings['Required'] == 'Yes']

    print(f"📊 Summary:")
    print(f"  Total mappings: {len(mappings)}")
    print(f"  Standard fields: {len(standard_fields)}")
    print(f"  Custom fields: {len(custom_fields)}")
    print(f"  Required fields: {len(required_fields)}\n")

    # Print required fields
    print(f"✅ REQUIRED FIELDS (must have data):")
    print(f"{'-'*70}")
    for _, row in required_fields.iterrows():
        print(f"  {row['Source Field']:30} → {row['Target Field']}")
    print()

    # Print standard field mappings
    print(f"📋 STANDARD FIELD MAPPINGS (auto-map):")
    print(f"{'-'*70}")
    for _, row in standard_fields.iterrows():
        required = "⚠️ REQUIRED" if row['Required'] == 'Yes' else ""
        print(f"  {row['Source Field']:30} → {row['Target Field']:30} {required}")
    print()

    # Print custom fields that need to be created
    if len(custom_fields) > 0:
        print(f"🔧 CUSTOM FIELDS (create in {target_crm} first):")
        print(f"{'-'*70}")
        for _, row in custom_fields.iterrows():
            print(f"  Field Name: {row['Target Field']}")
            print(f"    Data Type: {row['Data Type']}")
            print(f"    Maps from: {row['Source Field']}")
            print(f"    Notes: {row['Notes']}")
            print()

    # Special notes
    print(f"📝 SPECIAL INSTRUCTIONS:")
    print(f"{'-'*70}")

    # Find fields with special mapping notes
    special_notes = mappings[
        mappings['Notes'].str.contains('Map|Create|Use', case=False, na=False)
    ]

    for _, row in special_notes.iterrows():
        if not 'Standard field' in row['Notes']:
            print(f"  {row['Source Field']} → {row['Target Field']}")
            print(f"    {row['Notes']}")
            print()

    print(f"{'='*70}\n")


def main():
    parser = argparse.ArgumentParser(
        description='Map CRM fields from source to target CRM'
    )
    parser.add_argument(
        '--source',
        required=True,
        choices=['hubspot', 'salesforce'],
        help='Source CRM (hubspot or salesforce)'
    )
    parser.add_argument(
        '--target',
        required=True,
        choices=['zoho', 'freshsales', 'pipedrive'],
        help='Target CRM (zoho, freshsales, or pipedrive)'
    )
    parser.add_argument(
        '--template',
        default='templates/field-mapping.csv',
        help='Path to field mapping template (default: templates/field-mapping.csv)'
    )

    args = parser.parse_args()

    # Find template file (check both relative and absolute paths)
    template_path = Path(args.template)

    # If template not found, try looking in script's parent directory
    if not template_path.exists():
        script_dir = Path(__file__).parent
        template_path = script_dir.parent / args.template

    # Load field mappings
    df = load_field_mapping(template_path)

    # Get mappings for source → target
    mappings = get_mappings(df, args.source, args.target)

    # Generate report
    generate_report(mappings, args.source.title(), args.target.title())


if __name__ == '__main__':
    main()
