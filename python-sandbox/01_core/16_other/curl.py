#!/usr/bin/python3.12
# https://www.javatpoint.com/examples-of-python-curl

import pycurl
from io import BytesIO

b_obj_ = BytesIO()
crl_ = pycurl.Curl()
# Set URL value
crl_.setopt(crl_.URL, 'https://wiki.python.org/moin/BeginnersGuide')
# Write bytes that are utf-8 encoded
crl_.setopt(crl_.WRITEDATA, b_obj_)
# Perform a file transfer
crl_.perform()
# Ending the curl session
crl_.close()
# Getting the content store in the BytesIO obj (in byte character)
get_body_ = b_obj_.getvalue()
# Decoding the byte store in get_body_ to HTML and printing the result
print('Output of GET request:\n%s' % get_body_.decode('utf8'))

####=============================

headers_ = {}


def display_header(header_line_):
    header_line_ = header_line_.decode('iso-8859-1')
    # Ignoring all lines without a colons
    if ':' not in header_line_:
        return
        # Breaking the header lines into header names and values
    h_name_, h_value__ = header_line_.split(':', 1)
    # Removing whitespaces that may be there somewhere
    h_name_ = h_name_.strip()
    h_value__ = h_value__.strip()
    h_name_ = h_name_.lower()  # Converting header name to lowercase
    headers_[h_name_] = h_value__  # Header naming and adding value.


def main():
    print('****Using PycURLs to get Twitter Headers_****')
    b_obj_ = BytesIO()
    crl_ = pycurl.Curl()
    crl_.setopt(crl_.URL, 'https://twitter.com')
    crl_.setopt(crl_.HEADERFUNCTION, display_header)
    crl_.setopt(crl_.WRITEDATA, b_obj_)
    crl_.perform()
    print('Header values:-')
    print(headers_)
    print('-' * 20)


main()
