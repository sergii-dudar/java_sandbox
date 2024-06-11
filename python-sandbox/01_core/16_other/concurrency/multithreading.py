#!/usr/bin/python3.12

# thread.start_new_thread ( function_name, args[, kwargs] )


import threading  # import the thread module
import time  # import time module
from threading import *

# ========================================Sequential exec
print("\n========================================|||:Sequential exec")


def cal_sqre(num):  # define the cal_sqre function
    print(" Calculate the square root of the given number")
    for n in num:
        time.sleep(0.3)  # at each iteration it waits for 0.3 time
        print(' Square is : ', n * n)


def cal_cube(num):  # define the cal_cube() function
    print(" Calculate the cube of  the given number")
    for n in num:
        time.sleep(0.3)  # at each iteration it waits for 0.3 time
        print(" Cube is : ", n * n * n)


arr = [4, 5, 6, 7, 2]  # given array

t1 = time.time()  # get total time to execute the functions
cal_sqre(arr)  # call cal_sqre() function
cal_cube(arr)  # call cal_cube() function

print(" Total time taken by threads is :", time.time() - t1)  # print the total time

# ========================================Parallel exec
print("\n========================================|||:Parallel exec")

# start()	A start() method is used to initiate the activity of a thread. And it calls only once for each thread so that the execution of the thread can begin.
# run()	A run() method is used to define a thread's activity and can be overridden by a class that extends the threads class.
# join()	A join() method is used to block the execution of another code until the thread terminates.

t = time.time()  # get total time to execute the functions
# cal_cube(ar)
# cal_sqre(ar)
th1 = threading.Thread(target=cal_sqre, args=(arr,))
th2 = threading.Thread(target=cal_cube, args=(arr,))
th1.start()
th2.start()
th1.join()
th2.join()
print(" Total time taking by threads is :", time.time() - t)  # print the total time
print(" Again executing the main thread")
print(" Thread 1 and Thread 2 have finished their execution.")
