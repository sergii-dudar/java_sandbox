#!/usr/bin/python3.12

import json
import os

# Define the base directory (can be current working directory or a specific path)
base_dir = os.getcwd()  # Get current working directory

# Combine base directory and relative path using os.path.join
full_path = os.path.join(base_dir, '01_core/16_other/json/studnet1.json')

with open(full_path) as f:
    data = json.load(f)
print(data)

# ========================================
print("\n========================================|||:")
