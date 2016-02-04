# Author: Syukur Bin Md Kassim # Email: syukur.kassim@tmrnd.com.my
# Description: Copy files or/and folders in current directory
# to download destination

. ~/syukur/lib/echo-color.sh

#--------------------------------------------------------------------#
# THIS IS THE PLACE TO MODIFY THE SCRIPT TO SUITE YOUR NEED
# Add file to filter here separated by |
# PATTERN=<filter file/dir>|<another fileter>
PATTERN="`basename \"$0\"`|node_modules"
# Define the path of destination
DESTINATION=/var/www/html/downloads
#--------------------------------------------------------------------#

# Check folder, if not exist create (/var/www/hmtl/<current folder>)
SOURCE_FOLDER=`echo $PWD | awk -F "/" '{print $NF}'`
DESTINATION_PATH=$DESTINATION/$SOURCE_FOLDER
${ECHO_BLUE}INFO - SOURCE_FOLDER = $SOURCE_FOLDER $ECHO_END

if [ ! -d $DESTINATION_PATH ]; then
	mkdir $DESTINATION_PATH
	if [ $? == 0 ]; then
		${ECHO_BLUE}INFO - source folder created: $DESTINATION_PATH $ECHO_END
	else
		${ECHO_RED}ERROR - Failed to create folder: $DESTINATION_PATH ${ECHO_END}
	fi
else
	${ECHO_BLUE}INFO - source folder already exist: $DESTINATION_PATH $ECHO_END
fi

# Copy each file to $DESTINATION
for file in `ls`
do
	if [[ ! $file =~ $PATTERN ]];then
		cp -rf $file $DESTINATION_PATH
		${ECHO_BLUE}INFO - cp -rf $file $DESTINATION_PATH $ECHO_END
	fi
done


# TAMAT #
