from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

# Создание авторизатора без логина и пароля
authorizer = DummyAuthorizer()
authorizer.add_anonymous("./ftp-files")

# Добавление анонимного пользователя
# Пользователю присваиваются права на чтение и запись в указанной директории
authorizer.add_user("anonymous", "", "./ftp-files", perm="elradfmw")

# Создание обработчика с использованием авторизатора
handler = FTPHandler
handler.authorizer = authorizer

# Запуск FTP-сервера на порту 21
server = FTPServer(("0.0.0.0", 21), handler)
server.serve_forever()