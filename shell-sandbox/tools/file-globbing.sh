rm *.txt
rm file?.txt # (file1, file2... not file.10 etc)
rm file[0-9].txt
rm file[!6-9].txt # remove all, but not 6-9, not 10 ...