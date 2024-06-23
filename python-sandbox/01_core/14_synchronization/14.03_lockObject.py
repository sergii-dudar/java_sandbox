#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_thread_deadlock.htm

from threading import Thread, Lock
import time

lock = Lock()
threads = []


class myThread(Thread):
    def __init__(self, name):
        Thread.__init__(self)
        self.name = name

    def run(self):
        lock.acquire()
        synchronized(self.name)
        lock.release()


def synchronized(threadName):
    print("{} has acquired lock and is running synchronized method".format(threadName))
    counter = 5
    while counter:
        print('**', end='')
        time.sleep(2)
        counter = counter - 1
    print('\nlock released for', threadName)


t1 = myThread('Thread1')
t2 = myThread('Thread2')

t1.start()
threads.append(t1)

t2.start()
threads.append(t2)

for t in threads:
    t.join()
print("end of main thread")
