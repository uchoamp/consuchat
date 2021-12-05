CREATE DATABASE IF NOT EXISTS dbconsuchat;

USE dbconsuchat;

CREATE TABLE IF NOT EXISTS cliente(
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone CHAR(10) NOT NULL,
    endereco VARCHAR(255) NULL,
    nascimento DATE NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS clinica(
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    telefone CHAR(10) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    longitude VARCHAR(45),
    latitude VARCHAR(45),
    PRIMARY KEY (id)
) ;

CREATE TABLE IF NOT EXISTS consulta(
    id INT AUTO_INCREMENT,
    descricao VARCHAR(255) NULL,
    marcada DATETIME NOT NULL,
    duracao SMALLINT NOT NULL,
    realizada BOOLEAN,
    cliente_id INT NOT NULL,
    clinica_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (clinica_id) REFERENCES clinica(id)
);

CREATE TABLE IF NOT EXISTS horario(
    id INT AUTO_INCREMENT,
    am_inicio TIME NOT NULL,
    am_fim TIME,
    pm_inicio TIME,
    pm_fim TIME NOT NULL,
    intervalo TIME NOT NULL,
    almoco BOOLEAN,
    dia_semana TINYINT,
    clinica_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (clinica_id) REFERENCES clinica(id)
);

CREATE TABLE IF NOT EXISTS funcionario(
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    clinica_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (clinica_id) REFERENCES clinica(id)
);
