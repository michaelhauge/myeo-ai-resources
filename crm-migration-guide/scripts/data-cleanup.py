#!/usr/bin/env python3
"""
CRM Data Cleanup Script
Cleans exported CRM data before importing to new CRM

Features:
- Remove duplicate records (by email)
- Validate and fix email addresses
- Standardize phone number formats (SEA formats)
- Clean company names (trim whitespace, fix casing)
- Handle empty/null fields
- Generate cleanup report

Usage:
    python3 data-cleanup.py input.csv output.csv

    Optional flags:
    --remove-columns "column1,column2"  # Remove sensitive columns
    --country SG  # Default country for phone formatting (SG, MY, ID, TH)
"""

import sys
import re
import pandas as pd
from email.utils import parseaddr
import argparse


def validate_email(email):
    """Validate email address and return cleaned version or None"""
    if pd.isna(email) or not email:
        return None

    email = str(email).strip().lower()

    # Basic email regex
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

    if re.match(pattern, email):
        return email
    else:
        return None


def standardize_phone(phone, country='SG'):
    """
    Standardize phone number to international format
    Supports: Singapore (+65), Malaysia (+60), Indonesia (+62), Thailand (+66)
    """
    if pd.isna(phone) or not phone:
        return None

    # Remove all non-numeric characters except +
    phone = re.sub(r'[^\d+]', '', str(phone))

    # Country codes
    country_codes = {
        'SG': '+65',
        'MY': '+60',
        'ID': '+62',
        'TH': '+66'
    }

    # If already has country code, return as is
    if phone.startswith('+'):
        return phone

    # Remove leading zeros
    phone = phone.lstrip('0')

    # Add country code
    country_code = country_codes.get(country.upper(), '+65')

    # Validate length (rough check)
    if len(phone) >= 7 and len(phone) <= 15:
        return f"{country_code}{phone}"
    else:
        return None


def clean_company_name(company):
    """Clean company name: trim whitespace, fix casing"""
    if pd.isna(company) or not company:
        return None

    company = str(company).strip()

    # Fix common issues
    company = re.sub(r'\s+', ' ', company)  # Remove extra whitespace

    # Don't change casing (companies may have specific branding)
    return company


def remove_duplicates(df, key_column='Email'):
    """Remove duplicate records based on key column (default: Email)"""
    if key_column not in df.columns:
        print(f"Warning: Column '{key_column}' not found. Skipping duplicate removal.")
        return df, 0

    # Remove duplicates, keeping first occurrence
    before_count = len(df)
    df = df.drop_duplicates(subset=[key_column], keep='first')
    after_count = len(df)

    removed = before_count - after_count
    return df, removed


def clean_crm_data(input_file, output_file, remove_columns=None, country='SG'):
    """
    Main cleanup function

    Args:
        input_file: Path to input CSV
        output_file: Path to output CSV
        remove_columns: List of column names to remove (e.g., sensitive fields)
        country: Default country for phone formatting
    """
    print(f"Reading {input_file}...")
    df = pd.read_csv(input_file)

    initial_count = len(df)
    print(f"Initial record count: {initial_count}")

    # Report
    report = {
        'initial_count': initial_count,
        'duplicates_removed': 0,
        'invalid_emails': 0,
        'phone_standardized': 0,
        'companies_cleaned': 0,
        'columns_removed': 0
    }

    # 1. Remove sensitive columns if specified
    if remove_columns:
        columns_to_remove = [col.strip() for col in remove_columns.split(',')]
        existing_columns = [col for col in columns_to_remove if col in df.columns]
        if existing_columns:
            df = df.drop(columns=existing_columns)
            report['columns_removed'] = len(existing_columns)
            print(f"Removed {len(existing_columns)} sensitive columns: {existing_columns}")

    # 2. Remove duplicates (by email)
    if 'Email' in df.columns:
        df, duplicates = remove_duplicates(df, 'Email')
        report['duplicates_removed'] = duplicates
        print(f"Removed {duplicates} duplicate records")

    # 3. Validate and clean emails
    if 'Email' in df.columns:
        invalid_count = 0
        df['Email'] = df['Email'].apply(lambda x: validate_email(x))

        # Count invalid emails (now None)
        invalid_count = df['Email'].isna().sum()
        report['invalid_emails'] = invalid_count

        if invalid_count > 0:
            print(f"Warning: {invalid_count} invalid email addresses set to blank")

    # 4. Standardize phone numbers
    phone_columns = ['Phone', 'Phone Number', 'Work Number', 'Mobile', 'Mobile Number', 'Mobile Phone']
    for col in phone_columns:
        if col in df.columns:
            df[col] = df[col].apply(lambda x: standardize_phone(x, country))
            standardized = df[col].notna().sum()
            report['phone_standardized'] += standardized

    print(f"Standardized {report['phone_standardized']} phone numbers")

    # 5. Clean company names
    company_columns = ['Company', 'Company Name', 'Account Name', 'Organization', 'Organization Name']
    for col in company_columns:
        if col in df.columns:
            df[col] = df[col].apply(clean_company_name)
            cleaned = df[col].notna().sum()
            report['companies_cleaned'] += cleaned

    print(f"Cleaned {report['companies_cleaned']} company names")

    # 6. Handle empty fields (fill with empty string instead of NaN for CSV compatibility)
    df = df.fillna('')

    # Write output
    df.to_csv(output_file, index=False)
    final_count = len(df)

    print(f"\n{'='*50}")
    print("CLEANUP REPORT")
    print(f"{'='*50}")
    print(f"Initial records: {report['initial_count']}")
    print(f"Duplicates removed: {report['duplicates_removed']}")
    print(f"Invalid emails: {report['invalid_emails']}")
    print(f"Phone numbers standardized: {report['phone_standardized']}")
    print(f"Company names cleaned: {report['companies_cleaned']}")
    if report['columns_removed'] > 0:
        print(f"Sensitive columns removed: {report['columns_removed']}")
    print(f"\nFinal records: {final_count}")
    print(f"Output saved to: {output_file}")
    print(f"{'='*50}\n")

    return df


def main():
    parser = argparse.ArgumentParser(
        description='Clean CRM export data before importing to new CRM'
    )
    parser.add_argument('input_file', help='Input CSV file path')
    parser.add_argument('output_file', help='Output CSV file path')
    parser.add_argument(
        '--remove-columns',
        help='Comma-separated list of columns to remove (e.g., "credit_card,ssn")'
    )
    parser.add_argument(
        '--country',
        default='SG',
        choices=['SG', 'MY', 'ID', 'TH'],
        help='Default country for phone number formatting (default: SG)'
    )

    args = parser.parse_args()

    try:
        clean_crm_data(
            args.input_file,
            args.output_file,
            remove_columns=args.remove_columns,
            country=args.country
        )
        print("✅ Cleanup completed successfully!")

    except FileNotFoundError:
        print(f"❌ Error: File '{args.input_file}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Error during cleanup: {str(e)}")
        sys.exit(1)


if __name__ == '__main__':
    main()
