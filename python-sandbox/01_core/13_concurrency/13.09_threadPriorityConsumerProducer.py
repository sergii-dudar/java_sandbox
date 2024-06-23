#!/usr/bin/python3.12

from time import sleep
from random import random, randint
from threading import Thread
from queue import PriorityQueue

queue = PriorityQueue()


def producer(queue):
    print('Producer: Running')
    for i in range(5):
        # create item with priority
        value = random()
        priority = randint(0, 5)
        item = (priority, value)
        queue.put(item)
    # wait for all items to be processed
    queue.join()

    queue.put(None)
    print('Producer: Done')


def consumer(queue):
    print('Consumer: Running')

    while True:

        # get a unit of work
        item = queue.get()
        if item is None:
            break

        sleep(item[1])
        print(item)
        queue.task_done()
    print('Consumer: Done')


producer = Thread(target=producer, args=(queue,))
producer.start()

consumer = Thread(target=consumer, args=(queue,))
consumer.start()

producer.join()
consumer.join()
