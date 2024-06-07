#!/bin/bash

a=10
b=20

#-------------------------------------------------
# ========================================--if...fi
if [ $a == $b ]; then
  echo "a is equal to b"
fi

if [ $a != $b ]; then
  echo "a is not equal to b"
fi

#-------------------------------------------------
# ========================================--if...else...fi
echo

if [ $a == $b ]; then
  echo "a is equal to b"
else
  echo "a is not equal to b"
fi

#-------------------------------------------------
# ========================================--if...elif...else...fi
echo

if [ $a == $b ]; then
  echo "a is equal to b"
elif [ $a -gt $b ]; then
  echo "a is greater than b"
elif [ $a -lt $b ]; then
  echo "a is less than b"
else
  echo "None of the condition met"
fi

#-------------------------------------------------
# ========================================--case...esac (alternative of switch...case)
echo

FRUIT="kiwi"

case "$FRUIT" in
"apple")
  echo "Apple pie is quite tasty."
  ;;
"banana")
  echo "I like banana nut bread."
  ;;
"kiwi")
  echo "New Zealand is famous for kiwi."
  ;;
*)
  echo "Default case"
  ;;
esac
