# Usar a imagem oficial do PHP com Apache
FROM php:8.1-apache

# Definir variáveis de ambiente para MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=cliente_db
ENV MYSQL_USER=appuser
ENV MYSQL_PASSWORD=apppass
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar o sistema e instalar dependências
RUN apt-get update && apt-get install -y \
    default-mysql-server \
    default-mysql-client \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensões PHP necessárias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

# Configurar MySQL
RUN mkdir -p /etc/mysql/mysql.conf.d/
RUN echo "[mysqld]" > /etc/mysql/mysql.conf.d/mysqld.cnf
RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/mysql.conf.d/mysqld.cnf
RUN echo "skip-networking = 0" >> /etc/mysql/mysql.conf.d/mysqld.cnf

# Criar diretório para dados MySQL e configurar permissões
RUN mkdir -p /var/run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# Inicializar banco de dados MariaDB
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Copiar arquivos da aplicação
COPY ./app/ /var/www/html/
COPY ./database/ /tmp/database/
COPY ./scripts/ /usr/local/bin/

# Configurar Supervisor
COPY ./supervisor.conf /etc/supervisor/conf.d/supervisord.conf

# Dar permissões de execução aos scripts
RUN chmod +x /usr/local/bin/*.sh

# Dar permissões corretas para o Apache
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/

# Criar volume para MySQL
VOLUME ["/var/lib/mysql"]

# Expor portas
EXPOSE 80 3306

# Usar supervisor para gerenciar múltiplos serviços
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
