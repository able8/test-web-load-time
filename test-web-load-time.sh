#!/bin/bash

test_load_time () {
    URL=$1
    TOTAL=0
    echo -e "test \033[32m${URL}\033[0m load time:"
    for i in {1..6}
    do
        TIME=$(curl -sSL -w "%{time_total}" -o /dev/null "https://${URL}")
        printf "\e[1;32m%d\t\e[m" ${TIME%%.*}
        TOTAL=$(($TOTAL+${TIME%%.*}))
    done
    printf "total:\e[1;31m%d\e[m avg:\e[1;31m%d\e[m\n" ${TOTAL%%.*} $((${TOTAL%%.*}/6))
}

echo -ne 'your current ip: \033[32m '
curl ip.sb
echo -e " \033[0m"


test_load_time www.jd.com
test_load_time www.taobao.com
test_load_time www.google.com
test_load_time www.youtube.com