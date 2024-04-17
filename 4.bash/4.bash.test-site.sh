#!/bin/bash

PATTERN="Про важное"
URL="https://it.is.mysite.ru"
echo "Проверка наличия паттерна \"$PATTERN\" на странице: $URL"
RESULT=`/bin/bash ./test-site "$PATTERN" "$URL"`
if [ $RESULT = 200 ]; then
    echo "Сайт активен, НАЙДЕНО ключевое слово"
elif [ $RESULT = 204 ]; then
    echo "Сайт активен, ключевое слово ОТСУТСТВУЕТ"
else
    echo "Ошибка доступа к сайту. HTTP status code: $RESULT"
fi
