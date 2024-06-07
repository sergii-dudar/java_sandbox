#!/usr/bin/python3.12

import logging

# logging.basicConfig(filename='msg.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s')
logging.basicConfig(level=logging.DEBUG, format='%(name)s - %(levelname)s - %(message)s')

# NOTSET	0
# DEBUG	10
# INFO	20
# WARNING	30
# ERROR	40
# CRITICAL	50

def log_messages():
    logging.debug('The debug message is displaying')
    logging.info('The info message is displaying')
    logging.warning('The warning message is displaying')
    logging.error('The error message is displaying')
    logging.critical('The critical message is displaying')


log_messages()

# We can notice that the debug() and info() message didn't display messages because, by default,
# the log module logs the messages with a severity level of WARNING, ERROR and CRITICAL.

# ========================================

logging.debug("\n========================================|||:")
log_messages()
