# Простые рабочие мониторинговые скрипты с уведомление в чат телеграмма

1. Как создать своего бота и получить значение chat_id

2. Вспомогательные пакеты:
- curl - инструмент для передачи данных с сервера или на него. в нашем случае мы общаемся с API телеграм
- jq - вы можете использовать его для нарезки, фильтрации, сопоставления и преобразования структурированных данных с той же легкостью, с которой sed, awk, grep и их друзья позволяют вам играть с текстом

3. Примеры скриптов под задачи:

- Мониторинг места на жестком диске
- Мониторинг статуса контейнера Docker
- Информировании о входе через ssh

4. Создаем нашего бота и получаем BOT_ID и CHAT_ID

- Создать нового бота в телеграм, используя бота BotFather - найти в поиске, добавить и следовать инструкциям
- Полученные ID бота и его токен сохранить
- Создать в телеграм канал для уведомлений
- Добавить в канал бота IDBot, чтобы получить chat ID  - вызвать через встроенную инструкцию - узнать ID
- После получения ID чата (номер начинатеся с -) удалить бота IDBot из канала
Итого у нас есть на руках:
ID бота
Токен
ID канала
- Добавить в канал нашего бота и других пользователей, которым нужна нотификация.

в скрипт добавить данные бота и канала
Пример обращения к API телеграм через запрос curl

curl -s -X POST https://api.telegram.org/BOT_ID/sendMessage -d chat_id=CHAT_ID -d text="Всё в порядке!"

curl -s -X POST https://api.telegram.org/bot14!!!!!!!!!37:AAE!!!!!!!!!!!!!!!vrZuANk/sendMessage -d chat_id=-10!!!!!!!!!0 -d text="Тревога! Волк украл зайчат!" *

Примечание. Настоящие данные скрыты знаком !
