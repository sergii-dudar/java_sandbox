#!/bin/bash

class_name="org.concurrency.data.SyncCounterRunner"

# Step 1: Convert to package path (remove class name)
package_name="$(dirname "${class_name//./\/}")"

# Step 2: Count depth and generate "../.." dynamically
depth=$(tr -cd '/' <<< "$package_name" | wc -c)  # Count slashes
parent_path=$(printf "../%.0s" $(seq 1 $((depth+1))))  # Generate `..` for each level

echo "$package_name/"  # org/concurrency/
echo "$parent_path"    # ../..
