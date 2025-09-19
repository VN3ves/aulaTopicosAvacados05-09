-- Criar tabela Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL
);

-- Inserir 30 registros fictícios
INSERT INTO Clientes (Nome, Endereco, Cidade, Telefone) VALUES
('João Silva', 'Rua das Flores, 123', 'São Paulo', '(11) 98765-4321'),
('Maria Santos', 'Av. Paulista, 456', 'São Paulo', '(11) 97654-3210'),
('Pedro Oliveira', 'Rua dos Pinheiros, 789', 'São Paulo', '(11) 96543-2109'),
('Ana Costa', 'Rua Augusta, 321', 'São Paulo', '(11) 95432-1098'),
('Carlos Pereira', 'Av. Faria Lima, 654', 'São Paulo', '(11) 94321-0987'),
('Fernanda Lima', 'Rua Oscar Freire, 987', 'São Paulo', '(11) 93210-9876'),
('Roberto Alves', 'Av. Rebouças, 159', 'São Paulo', '(11) 92109-8765'),
('Juliana Rocha', 'Rua Haddock Lobo, 753', 'São Paulo', '(11) 91098-7654'),
('Marcos Ferreira', 'Av. Consolação, 852', 'São Paulo', '(11) 90987-6543'),
('Luciana Barbosa', 'Rua da Consolação, 741', 'São Paulo', '(11) 89876-5432'),
('André Gomes', 'Rua Teodoro Sampaio, 963', 'Rio de Janeiro', '(21) 98765-4321'),
('Patrícia Mendes', 'Av. Copacabana, 258', 'Rio de Janeiro', '(21) 97654-3210'),
('Ricardo Souza', 'Rua Visconde de Pirajá, 147', 'Rio de Janeiro', '(21) 96543-2109'),
('Camila Rodrigues', 'Av. Nossa Senhora de Copacabana, 369', 'Rio de Janeiro', '(21) 95432-1098'),
('Felipe Cardoso', 'Rua Barata Ribeiro, 582', 'Rio de Janeiro', '(21) 94321-0987'),
('Gabriela Martins', 'Av. Atlântica, 715', 'Rio de Janeiro', '(21) 93210-9876'),
('Thiago Moreira', 'Rua Santa Clara, 426', 'Rio de Janeiro', '(21) 92109-8765'),
('Larissa Dias', 'Av. Rio Branco, 837', 'Rio de Janeiro', '(21) 91098-7654'),
('Bruno Nascimento', 'Rua do Ouvidor, 194', 'Rio de Janeiro', '(21) 90987-6543'),
('Aline Campos', 'Av. Presidente Vargas, 675', 'Rio de Janeiro', '(21) 89876-5432'),
('Daniel Torres', 'Rua Savassi, 123', 'Belo Horizonte', '(31) 98765-4321'),
('Tatiane Ribeiro', 'Av. Afonso Pena, 456', 'Belo Horizonte', '(31) 97654-3210'),
('Gustavo Araújo', 'Rua da Bahia, 789', 'Belo Horizonte', '(31) 96543-2109'),
('Renata Freitas', 'Av. Brasil, 321', 'Belo Horizonte', '(31) 95432-1098'),
('Leonardo Castro', 'Rua Tupinambás, 654', 'Belo Horizonte', '(31) 94321-0987'),
('Vanessa Lopes', 'Av. Amazonas, 987', 'Belo Horizonte', '(31) 93210-9876'),
('Rafael Carvalho', 'Rua dos Goitacazes, 159', 'Belo Horizonte', '(31) 92109-8765'),
('Priscila Machado', 'Av. Cristiano Machado, 753', 'Belo Horizonte', '(31) 91098-7654'),
('Vinicius Teixeira', 'Rua Paraíba, 852', 'Belo Horizonte', '(31) 90987-6543'),
('Isabella Correia', 'Av. Antônio Carlos, 741', 'Belo Horizonte', '(31) 89876-5432');
