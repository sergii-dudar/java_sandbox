#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_date_time.htm

import time  # This is required to include time module.
import calendar
from datetime import date

ticks = time.time()
print("Number of ticks since 12:00am, January 1, 1970:", ticks)

# ========================================Current Time
print("\n========================================|||:Current Time")

localtime = time.localtime(time.time())
print("Local current time :", localtime)

# ========================================Formatted Time
print("\n========================================|||:Formatted Time")

localtime = time.asctime(time.localtime(time.time()))
print("Local current time :", localtime)

# ========================================Calendar for a Month
print("\n========================================|||:Calendar for a Month")

cal = calendar.month(2023, 4)
print("Here is the calendar:")
print(cal)

# ========================================date Object
print("\n========================================|||:date Object")

date1 = date(2023, 4, 19)
print("Date:", date1)
# date2 = date(2023, 4, 31)

# ========================================
print("\n========================================|||:")

# Getting min date
mindate = date.min
print("Minimum Date:", mindate)

# Getting max date
maxdate = date.max
print("Maximum Date:", maxdate)

Date1 = date(2023, 4, 20)
print("Year:", Date1.year)
print("Month:", Date1.month)
print("Day:", Date1.day)

# ========================================Date Class
print("\n========================================|||:Date Class")

print(date.today())
d1 = date.fromisoformat('2023-04-20')
print(d1)
d2 = date.fromisoformat('20230420')
print(d2)
d3 = date.fromisoformat('2023-W16-4')
print(d3)

# ========================================Instance Methods in Date Class
print("\n========================================|||:Instance Methods in Date Class")

from datetime import date

d = date.fromordinal(738630)  # 738630th day after 1. 1. 0001
print(d)
print(d.timetuple())
# Methods related to formatting string output
print(d.isoformat())
print(d.strftime("%d/%m/%y"))
print(d.strftime("%A %d. %B %Y"))
print(d.ctime())

print('The {1} is {0:%d}, the {2} is {0:%B}.'.format(d, "day", "month"))

# Methods for to extracting 'components' under different calendars
t = d.timetuple()
for i in t:
    print(i)

ic = d.isocalendar()
for i in ic:
    print(i)

# A date object is immutable; all operations produce a new object
print(d.replace(month=5))

# ========================================Python time Module
print("\n========================================|||:Python time Module")

from datetime import time

time1 = time(8, 14, 36)
print("Time:", time1)

time2 = time(minute=12)
print("time", time2)

time3 = time()
print("time", time3)

# time4 = time(hour=26)

from datetime import time

print()
print(time.min)
print(time.max)
print(time.resolution)

from datetime import time

print()
t = time(8, 23, 45, 5000)
print(t.hour)
print(t.minute)
print(t.second)
print(t.microsecond)

# ========================================
print("\n========================================|||:")

from datetime import datetime

dt = datetime(2023, 4, 20)
print(dt)

dt = datetime(2023, 4, 20, 11, 6, 32, 5000)
print(dt)

print()

from datetime import datetime

min = datetime.min
print("Min DateTime ", min)

max = datetime.max
print("Max DateTime ", max)

print()

from datetime import datetime

dt = datetime.now()

print("Day: ", dt.day)
print("Month: ", dt.month)
print("Year: ", dt.year)
print("Hour: ", dt.hour)
print("Minute: ", dt.minute)
print("Second: ", dt.second)

# ========================================Class Methods of datetime Object
print("\n========================================|||:Class Methods of datetime Object")

from datetime import datetime, date, time, timezone

# Using datetime.combine()
d = date(2022, 4, 20)
t = time(12, 30)
datetime.combine(d, t)

# Using datetime.now()
d = datetime.now()
print(d)

# Using datetime.strptime()
dt = datetime.strptime("23/04/20 16:30", "%d/%m/%y %H:%M")

# Using datetime.timetuple() to get tuple of all attributes
tt = dt.timetuple()
for it in tt:
    print(it)

# Date in ISO format
ic = dt.isocalendar()
for it in ic:
    print(it)

# ========================================timedelta Object
print("\n========================================|||:timedelta Object")
# The timedelta object represents the duration between two dates or two time objects.

from datetime import timedelta

delta = timedelta(
    days=100,
    seconds=27,
    microseconds=10,
    milliseconds=29000,
    minutes=5,
    hours=12,
    weeks=2
)
# Only days, seconds, and microseconds remain
print(delta)
print()

from datetime import datetime, timedelta

date1 = datetime.now()

date2 = date1 + timedelta(days=4)
print("Date after 4 days:", date2)

date3 = date1 - timedelta(15)
print("Date before 15 days:", date3)

print()

# Getting minimum value
min = timedelta.min
print("Minimum value:", min)

max = timedelta.max
print("Maximum value", max)

# ========================================
print("\n========================================|||:")

from datetime import timedelta

year = timedelta(days=365)
years = 5 * year
print(years)
print(years.days // 365)
646
year_1 = years // 5
print(year_1.days)
