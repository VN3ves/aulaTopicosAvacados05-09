# 📋 Sistema de Gerenciamento de Clientes - PHP + MySQL + Docker

Este projeto consiste em uma aplicação web desenvolvida em PHP que utiliza MySQL como banco de dados, tudo containerizado usando Docker. A aplicação lista clientes cadastrados em uma tabela com design responsivo e linhas alternadas para melhor visualização.

## 🚀 Características

- **Backend**: PHP 8.1 com Apache
- **Banco de Dados**: MySQL 8.0
- **Containerização**: Docker + Docker Compose
- **Interface**: HTML/CSS responsivo com tabela estilizada
- **Dados**: 30 registros fictícios de clientes
- **Persistência**: Volume Docker para dados do MySQL

## 📁 Estrutura do Projeto

```
jovanderPHP/
├── app/                    # Aplicação PHP
│   ├── index.php          # Página principal com listagem de clientes
│   └── config.php         # Configurações do banco de dados
├── database/              # Scripts SQL
│   └── init.sql           # Criação da tabela e inserção de dados
├── scripts/               # Scripts de inicialização
│   └── start-services.sh  # Script para iniciar MySQL e Apache
├── Dockerfile             # Configuração do container
├── docker-compose.yml     # Orquestração dos serviços
└── README.md             # Este arquivo
```

## 🛠️ Pré-requisitos

- Docker Desktop instalado
- Docker Compose instalado
- Portas 8080 e 3306 livres no sistema

## 📋 Tabela de Clientes

A aplicação utiliza uma tabela MySQL com a seguinte estrutura:

```sql
CREATE TABLE Clientes (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL
);
```

### Dados de Teste

A aplicação inclui 30 registros fictícios de clientes de diferentes cidades (São Paulo, Rio de Janeiro, Belo Horizonte) com dados realistas.

## 🚀 Como Executar

### Usando Docker (Container Único)

1. **Clone ou baixe o projeto:**
   ```bash
   git clone <seu-repositorio>
   cd jovanderPHP
   ```

2. **Construa a imagem:**
   ```bash
   docker build -t php-mysql-app .
   ```

3. **Execute o container com volume para persistência:**
   ```bash
   docker run -d -p 8080:80 -p 3306:3306 --name cliente-app -v mysql-data:/var/lib/mysql php-mysql-app
   ```

4. **Acesse a aplicação:**
   - Abra seu navegador e acesse: `http://localhost:8080`

### Comandos Úteis

- **Parar o container:**
  ```bash
  docker stop cliente-app
  ```

- **Iniciar novamente:**
  ```bash
  docker start cliente-app
  ```

- **Ver logs:**
  ```bash
  docker logs cliente-app
  ```

- **Remover container:**
  ```bash
  docker rm -f cliente-app
  ```

## 🔧 Configurações

### Banco de Dados
- **Host**: localhost
- **Porta**: 3306
- **Database**: cliente_db
- **Usuário**: appuser
- **Senha**: apppass

### Aplicação Web
- **Porta**: 8080
- **URL**: http://localhost:8080

## 📊 Funcionalidades

- ✅ Listagem completa de todos os clientes
- ✅ Tabela com cores alternadas nas linhas
- ✅ Design responsivo para diferentes tamanhos de tela
- ✅ Contador total de clientes
- ✅ Interface moderna com hover effects
- ✅ Dados persistentes via volume Docker

## 🐳 Docker Hub

Este projeto está disponível no Docker Hub:
- **Repositório**: [Seu usuário]/php-mysql-cliente-app
- **URL**: https://hub.docker.com/r/[seu-usuario]/php-mysql-cliente-app

Para usar a imagem do Docker Hub:
```bash
docker pull [seu-usuario]/php-mysql-cliente-app
docker run -p 8080:80 [seu-usuario]/php-mysql-cliente-app
```

## 🛑 Como Parar

Para parar o container:
```bash
docker stop cliente-app
```

Para remover completamente (incluindo volumes):
```bash
docker rm -f cliente-app
docker volume rm mysql-data
```

## 🔍 Solução de Problemas

### Problema: Porta 8080 em uso
**Solução**: Use uma porta diferente no comando docker run:
```bash
docker run -d -p 8081:80 -p 3306:3306 --name cliente-app -v mysql-data:/var/lib/mysql php-mysql-app
```

### Problema: Erro de conexão com MySQL
**Solução**: Aguarde alguns segundos após iniciar o container. O MySQL pode demorar para inicializar completamente.

### Problema: Página não carrega
**Verificação**:
1. Confirme que o container está rodando: `docker ps`
2. Verifique os logs: `docker logs cliente-app`
3. Teste a conectividade: `curl http://localhost:8080`

## 📝 Logs

Para visualizar os logs da aplicação:
```bash
# Ver logs do container
docker logs cliente-app

# Ver logs em tempo real
docker logs -f cliente-app
```

## 🛠️ Desenvolvimento

Para fazer alterações na aplicação:

1. Modifique os arquivos na pasta `app/`
2. Reconstrua o container:
   ```bash
   docker build -t php-mysql-app .
   docker rm -f cliente-app
   docker run -d -p 8080:80 -p 3306:3306 --name cliente-app -v mysql-data:/var/lib/mysql php-mysql-app
   ```

## 📋 Requisitos Atendidos

- ✅ Servidor Apache com suporte ao PHP
- ✅ Servidor MySQL no mesmo container
- ✅ Volume Docker para persistência dos dados
- ✅ Aplicação PHP funcional
- ✅ Banco convertido para MySQL
- ✅ Tabela Clientes com campos especificados
- ✅ 30 registros fictícios inseridos
- ✅ Listagem em tabela HTML
- ✅ Cores alternadas nas linhas
- ✅ Container inicia com todos os serviços ativos
- ✅ Aplicação funcional imediatamente após inicialização

## 🤝 Contribuições

Sinta-se à vontade para contribuir com melhorias:
1. Fork o projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📧 Contato

Para dúvidas ou sugestões, entre em contato através do GitHub.

---

**Desenvolvido com ❤️ usando PHP, MySQL e Docker**
