#!/usr/bin/python3.12

import os

home_dir = os.getenv('JAVA_HOME', 'default value')
print(home_dir)

print(os.getenv('SOME_VAR', 'default value'))
os.environ['SOME_VAR'] = 'some_value'
print(os.getenv('SOME_VAR', 'default value'))
