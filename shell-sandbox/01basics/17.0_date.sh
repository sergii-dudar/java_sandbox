#!/bin/bash

#date -u
date -I

# Date command accepts the options if provided like:
#  $ date +<format-option-codes><format-option-codes>

# Options:
# -d or -date= String	It is used to display the time set by the String value.
# -s, -set=String	It is used to set the time set by the String value.
# -f or -file=DateFile	It is used to process multiple dates.
# -I or -iso-8601[=Timespec]	It is used to generate an ISO 8601 compliant date/time string output.
# -r or -reference=File	It is used to print the last modification time of a file.
# -u, -utc, -universal	It is used to print or set Coordinated Universal Time.
# -help	It is used for getting the help of this command.
# -version	It is used to get the version information.


# Format Option | Part of Date| Description                                   |   Example Output
# with Codes	  |   	        |                                               |
# ========================================----------------------------------------------------------------------------------
# date +%a      | Weekday     | Name of a weekday in short form               | Mon
#                               (e.g., Sun, Mon, Tue, Wed, Thu, Fri, Sat      |
# date +%A      | Weekday     | Name of the weekday in full form              | Monday
#                               (e.g., Sunday, Monday, Tuesday, etc.)         |
# date +%b      | Month       | Name of the month in short form               | Jan
#                               (e.g., Jan, Feb, Mar, etc.)                   |
# date +%B      | Month       | Name of the month in full form                | January
#                               (e.g., January, February, etc.)               |
# date +%d      | Day         |	Day of the month (e.g., 01)                   | 27
# date +%D      | MM/DD/YY    | Current Date; shown in MM/DD/YY               | 08/27/2019
# date +%F      | YYYY-MM-DD  | Date; shown in YYYY-MM-DD                     | 2019-08-27
# date +%H      | Hour        | Hour in 24-hour clock format                  |  16
# date +%I      | Hour        | Hour in 12-hour clock format                  | 04
# date +%j      | Day         | Day of year (e.g., 001 to 366)                | 239
# date +%m      | Month       | Number of month (01 to 12 where 01 is January)| 08
# date +%M      | Minutes     | Minutes (00 to 59)                            | 55
# date +%S      | Seconds     | Seconds (00 to 59)                            | 28
# date +%N      | Nanoseconds | Nanoseconds (000000000 to 999999999)          | 300261496
# date +%T      | HH:MM:SS    | Time as HH:MM:SS (Hours in 24 Format)         | 15:59:10
# date +%u      | Day of Week | Day of week (01 to 07 where 01 is Monday)     | 02
# date +%U      | Week        | Displays week number of year where Sunday     | 35
#               |             |  is the first day of the week (00 to 53)      |
# date +%Y      | Year        | Displays full year (i.e., YYYY)               | 2019
# date +%Z      | Timezone    | Time zone abbreviation (e.g., IST, GMT)       | GMT

d=$(date +%m-%d-%Y)
echo -n "Date in format MM-DD-YYYY: $d" # 05-25-2024

echo
d=$(date +%m-%Y)
echo -n "Date in format MM-YYYY: $d" # 05-2024

echo
d=$(date '+%A %d-%B, %Y')
echo -n "Date in format Weekday DD-Month, YYYY: $d" # Saturday 25-May, 2024
