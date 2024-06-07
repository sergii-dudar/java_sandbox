#!/usr/bin/python3.12
# https://www.javatpoint.com/logging-in-python

import logging

# Create and configure logger using the basicConfig() function
logging.basicConfig(  # filename="newfile.log",
    # format='%(asctime)s %(message)s',
    # filemode='w'
    # format='%(process)d %(levelname)s: %(message)s'
    format='%(asctime)s %(levelname)s: %(message)s',
    datefmt='%d-%b-%yT%H:%M:%S'
)

# Creating an object of the logging
logger = logging.getLogger()

# Setting the threshold of logger to DEBUG
logger.setLevel(logging.DEBUG)

# Test messages
logger.debug("This is a harmless debug Message")
logger.info("This is just an information")
logger.warning("It is a Warning. Please make changes")
logger.error("You are trying to divide by zero")
logger.critical("Internet is down")

name = 'Peter Decosta'
logging.error('%s raised an error', name)

name = 'Antonio Mino'
logging.error(f'{name} raised an error')

try:
    c = a / b
except Exception as e:
    logging.error("Exception occurred", exc_info=True)
