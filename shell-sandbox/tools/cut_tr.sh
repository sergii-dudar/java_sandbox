#!/bin/bash
# ==========================
# ================cut

echo "This is a lint of text" | cut -c 1-10 # (chars range) This is a

cut -c 1-10 .zshrc
# If you c
# export P
# ...

cut -c 11- .zshrc # from char 11

# by delimiter (be default TAB)
echo "This is a lint of text" | cut -d ' ' -f5 # of
cut -d : -f 1 /etc/passwd | sort

echo "abc     def" | cut -d ' ' -f2   #
echo "abc     def" | awk '{print $2}' # def
echo "   abc     def" | awk '{print $2}' # def

# ==========================
# ================tr (translate)
echo "------------------  "
echo "This is a line of text" | tr a A # This is A line of text
echo "This is a line of text" | tr aeio AEIO # ThIs Is A lInE Of tExt
echo "This is a line of text" | tr -d aeio # [delete chart] Ths s  ln f txt
echo "This is a line of text" | tr -cd 'aeio\n' # [inverse delete] iiaieoe

echo "This is a line of text" | tr -d 'aeio ' # Thsslnftxt
echo "Thiisis iiis aaa   liiineee ooof teeeext" | tr -s 'aeio ' # [scwiss] Thisis is a line of text
echo "Thiisis iiis aaa   liiineee ooof teeeext" | tr -s '[:lower:]' '[:upper ]' # THISIS IS A   LINE OF TEXT

head --lines 3 /dev/urandom | tr -cd '[:print:]' # get only printable characters
# [:digit:]

# replace by sed
echo "This is a line of text" | sed -e 'y/ai/AI/' # ThIs Is A lIne of text
