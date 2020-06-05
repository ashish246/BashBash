#!/bin/bash

################################################################################
# This script is used to generate the payload in JSON format for the
# given/supplied directory. Payload contains the list of files with their
# relative paths and their hash keys.
# Hash keys are generated using SHA256 Cryptographic Hash Algorithm
# which generates an almost-unique, fixed size 256-bit (32-byte) hash.
#
# This script is using jq utility to generate JSON payload.
# Install instruction can be found here - https://stedolan.github.io/jq/download/
#
# Install sha256sum function, if it is not already there, using "brew install coreutils"
################################################################################

# Loop into the directory to list down files
#for entry in uam2/*; do
#	echo $entry;
#done

#foo="Hello"
#foo="${foo} World"
#echo "${foo}"

#tree -if --noreport uam2/
## https://superuser.com/questions/517595/given-a-directory-get-relative-paths-of-all-files-recursively
## https://unix.stackexchange.com/questions/199399/list-files-recursively-in-linux-cli-with-path-relative-to-the-current-directory
## https://stackoverflow.com/questions/23356779/how-can-i-store-the-find-command-results-as-an-array-in-bash/54561526
#find uam2/ -type f ! -name ".*"
#array=()
#mapfile -d '' array < <(find uam2/ -type f ! -name ".*")
#for (( i = 0; i < ${#array[@]}; ++i )); do
#	echo "${i}: ${array[i]}"
#done

ROOT_DIR=$1

# Check if any argument is passed or not
#if [ $# -eq 0 ]
#  then
#   ROOT_DIR=uam2/
#fi

# Check if argument is empty string or not
if [ -z "$1" ]
  then
   ROOT_DIR=uam2/
fi

#ROOT_DIR=uam2/

# Print the number of files and names of file
FILE_COUNT=$(ls $ROOT_DIR | wc -l)
echo $FILE_COUNT files found in the directory $ROOT_DIR

## Names of the files being hashed
## To ignore all invisible files, add ! -name ".*"
echo "Listing file names..."
array=(`find uam2/ -type f ! -name ".*"`)
#echo "${array[*]}"
for i in "${array[@]}"
do :
    echo "> $i"
done

## SHA 256 - https://askubuntu.com/questions/1091335/create-checksum-sha256-of-all-files-and-directories
## https://www.computerhope.com/unix/sha256sum.htm
## https://superuser.com/questions/1072679/bash-what-does-means#:~:text=%7B%7D%20has%20absolutely%20no%20meaning,the%20command%20executed%2C%20here%20find%20.&text=It%20is%20normally%20used%20to,on%20the%20same%20command%20line.
# find $ROOT_DIR -type f ! -name ".*" -exec sha256sum -t {} \; > tmpfile


## https://stackoverflow.com/questions/39523932/how-to-loop-through-a-list-in-shell
# IFS = Internal Field Separator
#declare -A file
#count=0
#while IFS= read -r string
#do
#    #echo "$string"
#	while IFS='  ' read -ra ADDR; do
#		echo "sha-hash: ${ADDR[0]}, name: ${ADDR[1]}"
#		file[${count}]="sha-hash: ${ADDR[0]}, name: ${ADDR[1]}"
#	done <<< "$string"
#  (( count++ ))
#done < <(find uam2/ -type f ! -name ".*" -exec sha256sum -t {} \;)

# FILES=(`find $ROOT_DIR -type f ! -name ".*" -exec sha256sum -t {} \;`) ## This is putting hash and name as separate array entry

## For Bash version 4 and higher - https://stackoverflow.com/questions/10942825/bash-loop-print-current-iteration
mapfile -t files < <(find $ROOT_DIR -type f ! -name ".*" -exec sha256sum -t {} \;)


## Print the FILES array
#echo "Print the files array entries..."
##echo "${files[*]}"
#for key in "${!files[@]}"
#do
#    echo "> ${files[$key]}"
#done


# echo "${files[*]}"
echo "Generating SHA hash key..."
for i in "${!files[@]}"
do
	while IFS='  ' read -ra ADDR; do
		echo "> ${ADDR[1]} -> ${ADDR[0]}"
		#echo "{ \"hash\": \"${ADDR[0]}\", \"name\": \"${ADDR[1]}\"}" | jq '{ name: .name, hash: .hash }' >> in.json

		# Append each File object in the in.json file in JSON format
		echo "[\"${ADDR[0]}\", \"${ADDR[1]}\"]" | jq '{ name: .[0], hash: .[1] }' >> temp.json
	done <<< "${files[i]}"
done

# Merge the objects in in.json to produce payload.json
jq -s . temp.json > payload.json
# Remove the temp temp.json file
rm temp.json
rm temp.json
echo "..."
echo "..."
echo "JSON file payload.json has been generated with file names and their hash keys."


## - https://stackoverflow.com/questions/26717277/converting-a-json-object-into-a-bash-associative-array
## 2-D arrays - https://www.tecmint.com/working-with-arrays-in-linux-shell-scripting/ | https://linuxconfig.org/how-to-use-arrays-in-bash-script


### Generating JSON from Array
# https://stackoverflow.com/questions/39895965/how-to-write-json-file-using-bash
# https://linuxhint.com/bash_jq_command/
# https://stackoverflow.com/questions/48991435/convert-values-from-array-in-json-object-using-bash-shell
# https://www.baeldung.com/linux/jq-command-json
# https://jqplay.org/s/BaI4jtzmUf
# https://stedolan.github.io/jq/tutorial/
# https://cameronnokes.com/blog/working-with-json-in-bash-using-jq/
# https://shapeshed.com/jq-json/
# https://zerokspot.com/weblog/2013/07/18/processing-json-with-jq/



# Make array of objects - https://stackoverflow.com/questions/38794449/creating-array-of-objects-in-bash
#declare -A identification0=(
#    [email]='test@abc.com'
#    [password]='admin123'
#)
#declare -A identification1=(
#    [email]='test@xyz.org'
#    [password]='passwd1!'
#)
#
#declare -n identification
#for identification in ${!identification@}; do
#    echo "Email: ${identification[email]}"
#    echo "Password: ${identification[password]}"
#done
#
####
#emails=('test@abc.com' 'test@xyz.org')
#passwords=('admin123' 'passwd1!')
#for (( i = 0; i < ${#emails[@]}; ++i )); do
#    echo "Email: ${emails[i]}"
#    echo "Password: ${passwords[i]}"
#done

# https://www.itechtics.com/3-ways-to-prevent-command-prompt-from-closing-after-running-commands/
# PAUSE 'Press [Enter] key to continue...'

# https://askubuntu.com/questions/20330/how-to-run-a-script-without-closing-the-terminal
# $SHELL
