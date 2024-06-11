#!/usr/bin/python3.12

# https://www.javatpoint.com/make-python-program-faster-using-concurrency

import requests
import time

import concurrent.futures
import threading

# ========================================Simple (slow)
print("\n========================================|||:Simple (slow)")


def download_site_from_network(url, session):
    with session.get(url) as response:
        print(f"Read {len(response.content)} from {url}")


def download_all_sites_from_network(sites):
    with requests.Session() as session:
        for url in sites:
            download_site_from_network(url, session)


sites = [
            "https://www.javatpoint.com"
        ] * 80
start_time = time.time()
download_all_sites_from_network(sites)
duration = time.time() - start_time
print(f"Downloaded {len(sites)} in {duration} seconds")

# ========================================Threading Version
print("\n========================================|||:Threading Version")

thread_local = threading.local()


def get_session():
    if not hasattr(thread_local, "session"):
        thread_local.session = requests.Session()
    return thread_local.session


def download_site(url):
    session = get_session()
    with session.get(url) as response:
        print(f"Read {len(response.content)} from {url}")


def download_all_sites(sites):
    with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
        executor.map(download_site, sites)


sites = ["https://www.javatpoint.com"] * 80
start_time = time.time()
download_all_sites(sites)
duration = time.time() - start_time
print(f"Downloaded {len(sites)} sites in {duration} seconds")
