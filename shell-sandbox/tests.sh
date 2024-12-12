#!/bin/bash

home="$HOME"
dir="/Users/serhii/serhii.home/work/git.work/ua-payments-payment-preprocessing/payment-preprocessing/src/main/java/ua/raiffeisen/payments/paymentpreprocessing"

while [ "$dir" != "$home" ]; do
    found_file=$(fd --no-ignore -d 1 -t f -H ".classpath.cache" "$dir")
    if [[ -n $found_file ]]; then
        break
    fi
    dir=$(dirname "$dir")
done

file="$dir/.classpath.cache"
cat "$file"

