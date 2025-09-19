# 🚀 Instruções de Execução Rápida

## ⚠️ Pré-requisitos IMPORTANTES

1. **Docker Desktop deve estar INSTALADO e RODANDO**
   - Baixe em: https://www.docker.com/products/docker-desktop
   - Certifique-se que está rodando (ícone na bandeja do sistema)

2. **Portas livres**: 8080 e 3306 devem estar disponíveis

## 🎯 Execução Passo a Passo

### 1. Verificar se Docker está rodando
```bash
docker --version
```
Se der erro, inicie o Docker Desktop.

### 2. Navegar para o diretório do projeto
```bash
cd C:\Users\VITOR\Desktop\jovanderPHP
```

### 3. Construir a imagem
```bash
docker build -t php-mysql-app .
```

### 4. Executar o container
```bash
docker run -d -p 8080:80 -p 3306:3306 --name cliente-app -v mysql-data:/var/lib/mysql php-mysql-app
```

### 5. Acessar a aplicação
- Abra o navegador em: **http://localhost:8080**

## 🛑 Para parar
```bash
docker stop cliente-app
```

## 🔧 Solução de Problemas

### "Docker não encontrado"
- Instale e inicie o Docker Desktop

### "Porta 8080 em uso"
- Use uma porta diferente: `-p 8081:80`
- Acesse: http://localhost:8081

### "Erro de build"
- Execute: `docker system prune -a`
- Tente novamente: `docker build -t php-mysql-app .`

## 📱 O que você verá
- Página web com listagem de 30 clientes
- Tabela com cores alternadas
- Design responsivo e moderno
