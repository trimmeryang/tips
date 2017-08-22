#!/bin/bash
#INPUT=/tmp/menu.sh.$$
INPUT=/tmp/menu.sh

# # trap and delete temp files
trap "rm $INPUT; exit" SIGHUP SIGINT SIGTERM

function login_qas(){
    dialog --backtitle "荷兰" \
--title "[ 荷兰 ]" \
--menu "上海qas列表" 20 50 10 \
20.220 "order service ／customer portal 等" \
20.221 "tracking service" \
20.212 "esb" \
20.216 "order portal" \
20.215 "T&T page" \
20.218 "elasticsearch" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

# make decsion 
case $menuitem in
	20.220) sshpass -p 1234 ssh vidaxl@192.168.20.220;;
    20.221) sshpass -p 1234 ssh vidaxl@192.168.20.221;;
    20.216) sshpass -p 1234 ssh vidaxl@192.168.20.216;;
    20.215) sshpass -p 1234 ssh vidaxl@192.168.20.215;;
    20.212) sshpass -p 1234 ssh vidaxl@192.168.20.212;;
    20.218) sshpass -p 1234 ssh vidaxl@192.168.20.218;;
	Exit) echo "Bye"; 
esac

}

function login_sh(){
    dialog --backtitle "上海" \
--title "[ 上海 ]" \
--menu "上海服务器列表" 20 50 10 \
orderPortal "orderPortal" \
40.61 "192.168.40.61" \
40.51 "sh proxy server" \
40.52 "cms.sh.test.vidaxl.com" \
40.53 "esb-01 qas.esb.sh.test.vidaxl.com" \
40.54 "magento sh" \
40.55 "esb 02" \
40.56 "esb 03" \
logstash "logstash" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

# make decsion 
case $menuitem in
    orderPortal) ssh orderportal@192.168.40.50;;
	40.61) sshpass -p x98wdfhj ssh vidaxl@192.168.40.61;;
    40.51) sshpass -p s4tg5y3v ssh vidaxl@192.168.40.51;;
    40.52) sshpass -p x9a7et3t ssh vidaxl@192.168.40.52;;
    40.53) sshpass -p g87ybehb ssh vidaxl@192.168.40.53;;
    40.54) sshpass -p x5sdsd2p ssh vidaxl@192.168.40.52;;
    40.55) sshpass -p yun8tc9n ssh vidaxl@192.168.40.55;;
    40.56) sshpass -p wh2ttgq8 ssh vidaxl@192.168.40.56;;
    logstash) ssh logstash@192.168.40.26;;
	Exit) echo "Bye"; 
esac

}

### display main menu ###
dialog --clear  --backtitle "登录服务器" \
--title "[ 地址 - 选择 ]" \
--menu "选择服务器登录" 15 50 4 \
上海 "上海" \
qas "荷兰qas" \
Exit "退出" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion 
case $menuitem in
	Date/time) show_date;;
	Calendar) show_calendar;;
    上海) login_sh;;
    qas) login_qas;;
	Exit) echo "Bye"; break;;
esac

done

# if temp files found, delete em
# [ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT
