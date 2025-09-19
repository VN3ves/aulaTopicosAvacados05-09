#!/bin/bash

# Iniciar MySQL
service mysql start

# Aguardar MySQL estar pronto
until mysqladmin ping -h localhost --silent; do
  echo 'Aguardando MySQL estar pronto...'
  sleep 2
done

# Criar banco e usuário se não existir
mysql -e "CREATE DATABASE IF NOT EXISTS cliente_db;"
mysql -e "CREATE USER IF NOT EXISTS 'appuser'@'localhost' IDENTIFIED BY 'apppass';"
mysql -e "GRANT ALL PRIVILEGES ON cliente_db.* TO 'appuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Executar scripts SQL se existirem
if [ -f /docker-entrypoint-initdb.d/init.sql ]; then
    mysql -u appuser -p'apppass' cliente_db < /docker-entrypoint-initdb.d/init.sql
fi

# Iniciar Apache em foreground
apache2-ctl -D FOREGROUND
