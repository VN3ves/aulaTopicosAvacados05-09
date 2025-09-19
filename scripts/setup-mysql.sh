#!/bin/bash

# Aguardar MySQL estar pronto
echo "Aguardando MySQL iniciar..."
until mysqladmin ping -h localhost --silent; do
  echo "MySQL ainda não está pronto, aguardando..."
  sleep 3
done

echo "MySQL iniciado, configurando banco de dados..."

# Configurar MySQL com senha root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Criar banco de dados
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

# Criar usuário da aplicação
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Dar privilégios
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Executar script de inicialização
if [ -f /tmp/database/init.sql ]; then
    echo "Executando script de inicialização..."
    mysql -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" "${MYSQL_DATABASE}" < /tmp/database/init.sql
    echo "Script de inicialização executado com sucesso!"
else
    echo "Arquivo init.sql não encontrado!"
fi

echo "Configuração do MySQL concluída!"
