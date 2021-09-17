PASS="."
OPTION=$1
if [ $OPTION == "-f" ];
then
    if ! [ -f $2 ];
    then
        echo "This file doesn't exist" && exit 1;
    fi
PASS=`cat $2`
else
 PASS=$1
 fi   

ISOK=0 #i set at the start that the pass is ok
       #but if the script finds an error it will change it to false
       #and print all the things that are not ok

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


if [ ${#PASS} -lt 10 ];
then
    echo "Password Must be at least 10 characters long" && ISOK=1
fi
 
if ! [[ ${PASS} =~ [[:upper:]] ]];
then
echo "Password Must have at least 1 uppercase character" && ISOK=1
fi

if ! [[ ${PASS} =~ [[:lower:]] ]];
then
    echo "Password Must have at least 1 lowercase character" && ISOK=1
fi

if ! [[ ${PASS} =~ [[:digit:]] ]];
then
    echo "Password Must have at least 1 digit" && ISOK=1
fi

if [ ${ISOK} -eq 0 ];
then
    echo -e "${GREEN}Password is Strong${NC}" && exit 0
else
    echo -e "${RED}Password is Weak${NC}" && exit 1
fi


