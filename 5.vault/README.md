Стенд: разворачиваю consul+vault (docker-compose), jenkins+ansible (localhost)

Первый вариант, неправильный, но его успешно протестил - для случая доступа к vault по логину и паролю.
========================================================================================
Пароль хранить в jenkins secrets и передавать в ansible-playbook через extraVars
(+) в jenkins хранится только зашифрованный пароль, логина нет
(+) в плейбуке только логин и ссылка
(-) светится логин, можно сделать лучше
(-) рекомендуется использовать токены вместо логин+пароль

Второй вариант, красивый и правильный, но не удалось его протестировать из-за сложностей с активацией ACL в consul docker image
========================================================================================
В секретах jenkins храню secretid роли, позволяющий создать временный токен для сессии ansible
Передаю его через переменную окружения
(+) нигде не хранятся данные для получения секрета

