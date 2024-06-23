#!/usr/bin/python3.12

import asyncio


class Oddnumbers():
    def __init__(self):
        self.start = -1

    def __aiter__(self):
        return self

    async def __anext__(self):
        if self.start >= 9:
            raise StopAsyncIteration
        self.start += 2
        await asyncio.sleep(1)
        return self.start


async def main():
    it = Oddnumbers()
    while True:
        try:
            awaitable = anext(it)
            result = await awaitable
            print(result)
        except StopAsyncIteration:
            break


asyncio.run(main())
