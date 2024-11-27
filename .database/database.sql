
DROP DATABASE IF EXISTS pybloco;
CREATE DATABASE pybloco
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE pybloco;

CREATE TABLE usuario (
    u_id INT PRIMARY KEY AUTO_INCREMENT,
    u_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    u_nome VARCHAR(127) NOT NULL,
    u_nascimento DATE NOT NULL,
    u_email VARCHAR(255) NOT NULL,
    u_senha VARCHAR(63) NOT NULL,
    u_status ENUM ('on', 'off', 'del') DEFAULT 'on'
);

CREATE TABLE notas (
    n_id INT PRIMARY KEY AUTO_INCREMENT,
    n_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    n_foto VARCHAR(255),
    n_usuario INT NOT NULL,
    n_nome VARCHAR(127) NOT NULL,
    n_descricao TEXT,
    n_localizacao VARCHAR(255),
    n_status ENUM ('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (n_usuario) REFERENCES usuario(u_id)
);


-- Tabela 'usuario'
INSERT INTO usuario (
    u_nome,
    u_nascimento,
    u_email,
    u_senha
) VALUES (
    'Joaquim da Silva',
    '2000-04-25',
    'joaquimsilva@email.com',
    SHA1('Senha123') -- Criptografa a senha do usuário
), (
    'Ana Martins',
    '2003-03-12',
    'Ana@email.com',
    SHA1('Senha123')
), (
    'Pedro de Souza',
    '1998-12-14',
    'souza@email.com',
    SHA1('Senha123')
);

