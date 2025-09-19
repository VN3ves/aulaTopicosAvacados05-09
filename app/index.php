<?php
require_once 'config.php';

// Conectar ao banco de dados
$pdo = conectarBanco();

// Buscar todos os clientes
try {
    $stmt = $pdo->query("SELECT * FROM Clientes ORDER BY Id_Cliente");
    $clientes = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    die("Erro ao buscar clientes: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Clientes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 3px solid #007bff;
            padding-bottom: 10px;
        }
        
        .stats {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }
        
        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        tr:nth-child(odd) {
            background-color: #ffffff;
        }
        
        tr:hover {
            background-color: #e3f2fd;
            cursor: pointer;
        }
        
        .id-column {
            width: 10%;
            text-align: center;
            font-weight: bold;
        }
        
        .nome-column {
            width: 25%;
        }
        
        .endereco-column {
            width: 35%;
        }
        
        .cidade-column {
            width: 15%;
        }
        
        .telefone-column {
            width: 15%;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            color: #666;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
                margin: 10px;
            }
            
            table {
                font-size: 14px;
            }
            
            th, td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📋 Sistema de Gerenciamento de Clientes</h1>
        
        <div class="stats">
            <h3>Total de Clientes Cadastrados: <?php echo count($clientes); ?></h3>
        </div>
        
        <?php if (empty($clientes)): ?>
            <div style="text-align: center; padding: 50px; color: #666;">
                <h3>Nenhum cliente encontrado</h3>
                <p>Não há clientes cadastrados no sistema.</p>
            </div>
        <?php else: ?>
            <table>
                <thead>
                    <tr>
                        <th class="id-column">ID</th>
                        <th class="nome-column">Nome</th>
                        <th class="endereco-column">Endereço</th>
                        <th class="cidade-column">Cidade</th>
                        <th class="telefone-column">Telefone</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($clientes as $cliente): ?>
                        <tr>
                            <td class="id-column"><?php echo htmlspecialchars($cliente['Id_Cliente']); ?></td>
                            <td class="nome-column"><?php echo htmlspecialchars($cliente['Nome']); ?></td>
                            <td class="endereco-column"><?php echo htmlspecialchars($cliente['Endereco']); ?></td>
                            <td class="cidade-column"><?php echo htmlspecialchars($cliente['Cidade']); ?></td>
                            <td class="telefone-column"><?php echo htmlspecialchars($cliente['Telefone']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
        
        <div class="footer">
            <p><strong>Sistema de Clientes - PHP + MySQL em Docker</strong></p>
            <p>Aplicação desenvolvida com PHP, MySQL e containerizada com Docker</p>
            <p>Data: <?php echo date('d/m/Y H:i:s'); ?></p>
        </div>
    </div>
</body>
</html>
