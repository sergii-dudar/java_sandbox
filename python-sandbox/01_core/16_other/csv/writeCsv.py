#!/usr/bin/python3.12

import csv
import pandas as pd

# ========================================Writing CSV Files
print("\n========================================|||:Writing CSV Files")

with open('pythonw.csv', 'w') as csvfile:
    fieldnames = ['first_name', 'last_name', 'Rank']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerow({'Rank': 'B', 'first_name': 'Parker', 'last_name': 'Brian'})
    writer.writerow({'Rank': 'A', 'first_name': 'Smith', 'last_name': 'Rodriguez'})
    writer.writerow({'Rank': 'B', 'first_name': 'Jane', 'last_name': 'Oscar'})
    writer.writerow({'Rank': 'B', 'first_name': 'Jane', 'last_name': 'Loive'})

print("Writing complete")

# ========================================CSV into a Dictionary
print("\n========================================|||:CSV into a Dictionary")

with open('pythonw2.csv', mode='w') as csv_file:
    fieldnames = ['emp_name', 'dept', 'birth_month']
    writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerow({'emp_name': 'Parker', 'dept': 'Accounting', 'birth_month': 'November'})
    writer.writerow({'emp_name': 'Smith', 'dept': 'IT', 'birth_month': 'October'})

# ========================================Writing CSV Files Using Pandas
print("\n========================================|||:Writing CSV Files Using Pandas")

df = pd.read_csv('hrdata.csv',
                 index_col='Employee',
                 parse_dates=['Hired'],
                 header=0,
                 names=['Employee', 'Hired', 'Salary', 'Sick Days'])
df.to_csv('hrdata_modified.csv')
