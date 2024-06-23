#!/usr/bin/python3.12

# Logging Levels:
# DEBUG    - Detailed information, typically of interest only when diagnosing problems.
# INFO     - Confirmation that things are working as expected.
# WARNING  - An indication that something unexpected happened, or indicative of some problem
#   in the near future (e.g. 'disk space low'). The software is still working as expected.
# ERROR    - Due to a more serious problem, the software has not been able to perform some function.
# CRITICAL - A serious error, indicating that the program itself may be unable to continue running.

import logging

logging.basicConfig(level=logging.DEBUG)
# logging.basicConfig(filename='logs.txt', filemode='w', level=logging.DEBUG)

logging.debug('This is a debug message')
logging.info('This is an info message')
logging.warning('This is a warning message')
logging.error('This is an error message')
logging.critical('This is a critical message')

print()
marks = 120
logging.error("Invalid marks:{} Marks must be between 0 to 100".format(marks))
subjects = ["Phy", "Maths"]
logging.warning("Number of subjects: {}. Should be at least three".format(len(subjects)))
