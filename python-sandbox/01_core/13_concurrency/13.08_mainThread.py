#!/usr/bin/python3.12

from time import sleep
from threading import current_thread
from threading import Thread


# function to be executed by a new thread
def run():
    # get the current thread
    th = current_thread()
    # is it a daemon thread?
    print(f'Daemon thread: {th.daemon}')


# create a new thread
thread = Thread(target=run)

# start the new thread
thread.start()

# block for a 0.5 sec
sleep(0.5)
