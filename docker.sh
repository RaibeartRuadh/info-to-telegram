#!/bin/bash
# Информатор о статусе контейнера docker (запущен, остановлен)
#
# Задайте переменную и укажите в качестве значения наименование контейнера.
# В пример у нас контейнер с названием nginx
d_nginx=nginx
# команда получения статуса работы контейнера
# Данные проверки сохраняются в логе /opt/m4telegram/counter
containers=`docker ps -f status=running --format "{{.Names}}"` point=$(cat /opt/m4telegram/counter 2>/dev/null);status=$?
# Проверка если контейнер остановлен, то писать в чат телеграмма
# Как создать бота и настроить сообщения вв чат есть в описании 
# Заменить CHAT_ID на ID вашего чата
# Заменить BOT_ID на ID вашего бота

  if echo $containers |grep -q $d_nginx
    then  echo "$d_nginx online "
      else  echo "$d_nginx offline" &&  curl -s -X POST https://api.telegram.org/BOT_ID/sendMessage -d chat_id=CHAT_ID -d text="Алерт! Остановлен web-сервер!" && echo 0 > /opt/m4telegram/counter
      # При сбое, обнуляем счетчик uptime
  fi

status=$(( $point + 1 ))
echo $status > /opt/m4telegram/counter
# При достижении uptime бот отписывает о статусе докера и обнуляет счетчик uptime
# Значение uptime - сумма результатов положительных проверок на работособность сервиса
     if [ $point -gt 276 ]
     then curl -s -X POST https://api.telegram.org/BOT_ID/sendMessage -d chat_id=CHAT_ID -d text="Всё в порядке!" && echo "0" > /opt/m4telegram/counter
     else echo $point
  fi


exit 0


