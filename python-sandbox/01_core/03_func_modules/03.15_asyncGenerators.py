#!/usr/bin/python3.12

# async def generator():
# . . .
# . . .
# yield obj
# it = generator()
# anext(it)
# . . .

import asyncio


async def async_generator(x):
    for i in range(1, x + 1):
        await asyncio.sleep(1)
        yield i


async def main():
    async for item in async_generator(5):
        print(item)


asyncio.run(main())

# ========================================
print("\n========================================|||:")


async def fibonacci(n):
    a, b = 0, 1
    while True:
        c = a + b
        if c >= n:
            break
        await asyncio.sleep(1)
        yield c
        a, b = b, c
    return


async def main():
    f = fibonacci(10)
    async for num in f:
        print(num)


asyncio.run(main())
