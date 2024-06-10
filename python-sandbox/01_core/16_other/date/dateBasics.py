#!/usr/bin/python3.12

import datetime
import time
from datetime import datetime as dt
import calendar

# prints the number of ticks spent since 12 AM, 1st January 1970
print(time.time())

# returns a time tuple
print(time.localtime(time.time()))

# returns the formatted time
print(time.asctime(time.localtime(time.time())))

# ========================================sleep time
print("\n========================================|||:sleep time")

# for i in range(0, 5):
#    print(i)
#    # Each element will be printed after 1 second
#    time.sleep(1)

# ========================================
print("\n========================================|||:")

# returns the current datetime object
print(datetime.datetime.now())

# returns the datetime object for the specified date
print(datetime.datetime(2020, 4, 4))

# returns the datetime object for the specified time
print(datetime.datetime(2020, 4, 4, 1, 26, 40))

# ========================================Comparison of two dates
print("\n========================================|||:Comparison of two dates")

# Compares the time. If the time is in between 8AM and 4PM, then it prints working hours otherwise it prints fun hours
if dt(dt.now().year, dt.now().month, dt.now().day, 8) < dt.now() < dt(dt.now().year, dt.now().month, dt.now().day, 16):
    print("Working hours....")
else:
    print("fun hours")

# ========================================The calendar module
print("\n========================================|||:The calendar module")

cal = calendar.month(2020, 3)
# printing the calendar of December 2018
print(cal)

# ========================================
print("\n========================================|||:")

# printing the calendar of the year 2019
print(calendar.prcal(2020))
