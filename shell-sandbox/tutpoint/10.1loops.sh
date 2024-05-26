#!/usr/local/bin/bash
#echo $BASH_VERSION

#------------------------------------------------
#----------------The for Loop
echo -e "\n"

# for variable in list...   - The list can contain numbers or string etc. separated by spaces.
# for (( expression1; expression2; expression3 ))...



words="Start learning from Javatpoint."
numbers="1 2 3 4 5 6 7 0"

#for item in 0 1 2 3 4 5 6 7 8 9; do
#for item in $numbers; do
#for item in {1..10}  ; do  # {START..END..INCREMENT} - supported by
for item in {0..10..2}; do
  echo -n "$item+ "
done

#-------------------------------------------
#----------------The while Loop
echo -e "\n"

#------------------------------------------------
#----------------The until Loop
echo -e "\n"

#------------------------------------------------
#----------------The nesting Loop
echo -e "\n"

#------------------------------------------------
#----------------The select Loop
#echo -e "\n"
