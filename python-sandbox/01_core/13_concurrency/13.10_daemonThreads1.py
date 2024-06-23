#!/usr/bin/python3.12

from time import sleep
from threading import current_thread
from threading import Thread


# function to be executed in a new thread
def run():
    # get the current thread
    thread = current_thread()
    # is it a daemon thread?
    print(f'Daemon thread: {thread.daemon}')


# create a new thread
thread = Thread(target=run, daemon=True)

# start the new thread
thread.start()

# block for a 0.5 sec for daemon thread to run
sleep(0.5)
