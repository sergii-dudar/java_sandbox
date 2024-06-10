#!/usr/bin/python3.12
# https://www.javatpoint.com/python-read-csv-file

import csv
import pandas as pd

with open('python.csv', newline='') as csv_file:
    csv_read = csv.reader(csv_file, delimiter=',')

    # To Read and display each row
    for row in csv_read:
        print(row)

# ========================================Read a CSV into a Dictionary
print("\n========================================|||:Read a CSV into a Dictionary")

with open('python.csv', mode='r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    line_count = 0

    for row in csv_reader:
        if line_count == 0:
            print(f'The column names are as follows : {", ".join(row)}')
            line_count += 1

        print(f'\t{row.get("name")} lives in {row["city"]} department and is {row["age"]} years old. ')
        line_count += 1

    print(f'Processed {line_count} lines.')

# ========================================Reading csv files with Pandas
print("\n========================================|||:Reading csv files with Pandas")

df = pd.read_csv('python.csv')

# Print the DataFrame
print(df)
