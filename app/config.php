<?php
// Configurações do banco de dados
define('DB_HOST', '127.0.0.1');
define('DB_PORT', '3306');
define('DB_USER', 'appuser');
define('DB_PASS', 'apppass');
define('DB_NAME', 'cliente_db');

// Função para conectar ao banco de dados
function conectarBanco() {
    try {
        $dsn = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME . ";charset=utf8";
        $pdo = new PDO($dsn, DB_USER, DB_PASS);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch(PDOException $e) {
        die("Erro na conexão: " . $e->getMessage());
    }
}
?>
