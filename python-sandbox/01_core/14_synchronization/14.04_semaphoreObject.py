#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_thread_deadlock.htm

from threading import Thread, Lock
import time

from threading import *
import time

# creating thread instance where count = 3
lock = Semaphore(4)


# creating instance
def synchronized(name):
    # calling acquire method
    lock.acquire()

    for n in range(3):
        print('Hello! ', end='')
        time.sleep(1)
        print(name)

        # calling release method
        lock.release()


# creating multiple thread
thread_1 = Thread(target=synchronized, args=('Thread 1',))
thread_2 = Thread(target=synchronized, args=('Thread 2',))
thread_3 = Thread(target=synchronized, args=('Thread 3',))

# calling the threads
thread_1.start()
thread_2.start()
thread_3.start()
