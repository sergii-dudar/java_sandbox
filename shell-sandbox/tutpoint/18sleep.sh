#!/bin/bash

# sleep number[suffix]

#suffix options:
# s - seconds (default if no suffix present)
# m - minutes
# h - hours
# d - days

# When two or more arguments are specified, then the total amount of time will be considered as the time equivalent to the sum of their values.

# examples:
# `sleep 9` or `sleep 9s`       # Sleep for 9 seconds, use
# `sleep 0.5` or `sleep 0.5s`   # Sleep for 0.5 seconds, use
# `sleep 2m 30s`                # Sleep for 2 minute and 30 seconds, use
# `sleep 8h`                    # Sleep for 8 hours
# `sleep 2d 9h 5m 55s`          # Sleep for 2 days, 9 hours, 5 minute and 55 seconds, use

# start time
date +"%H:%M:%S"

echo "wait for 9 seconds"

# sleep for 9 seconds
sleep 9s
# you can also use "sleep 9" in place of "sleep 9s" because if there is no suffix, it is considered as "seconds".

# end time
date +"%H:%M:%S"

echo "Task Completed"

#output:
# 19:42:08
# wait for 9 seconds
# 19:42:17
# Task Completed
