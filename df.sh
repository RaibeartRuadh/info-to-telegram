#!/bin/bash
# Уведомление в чат телеграмма об окончании места на диске
# Сообщение при достижении 95% на /dev/vda1
# Как получить ID бота и чата описано отдельно
# Замените значения BOT_ID  CHAT_ID на свои
# Вместо /dev/vda1 могут быть другие варианты
if [ "`df | grep "/dev/vda1" | awk '{print $5}' | sed 's/\%//'`" -ge 95 ]; 
 then echo "Disk usage exceeded 95%" | curl -s -X POST https://api.telegram.org/BOT_ID/sendMessage -d chat_id=CHAT_ID -d text="Warning - диск заполнен на 95%!";
fi
# Сообщение при достижении 99% на /dev/vda1
# Как получить ID бота и чата описано отдельно
# BOT_ID  CHAT_ID
if [ "`df | grep "/dev/vda1" | awk '{print $5}' | sed 's/\%//'`" -ge 99 ]; 

then echo "Disk usage exceeded 99%!" | curl -s -X POST https://api.telegram.org/BOT_ID/sendMessage -d chat_id=CHAT_ID -d text="Critical - диск заполнен на 99%!";

fi
