CREATE DATABASE IF NOT EXISTS dbconsuchat;

USE dbconsuchat;

CREATE TABLE IF NOT EXISTS cliente(
	id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone CHAR(10) NOT NULL,
    endereco VARCHAR(255) NULL,
    nascimento DATE NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS clinica(
	id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
	telfone CHAR(11) NOT NULL,
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
    realizada BOOLEAN,
    id_cliente INT NOT NULL,
    id_clinica INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_clinica) REFERENCES clinica(id)
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
    id_clinica INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_clinica) REFERENCES clinica(id)
);

CREATE TABLE IF NOT EXISTS funcionario(
    id INT AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    id_clinica INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_clinica) REFERENCES clinica(id)
);
