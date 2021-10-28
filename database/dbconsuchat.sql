CREATE DATABASE IF NOT EXISTS dbconsuchat;

USE dbconsuchat;

CREATE TABLE cliente(
	id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(14) NOT NULL,
    telefone CHAR(20) NOT NULL,
    endereco VARCHAR(255) NULL,
    NASCIMENTO DATE NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE clinica(
	id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
	fone_contato CHAR(20) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    longitude VARCHAR(45) NOT NULL,
    latitude VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE consulta(
	id INT AUTO_INCREMENT,
    desc VARCHAR(255) NULL,
    marcada DATETIME NOT NULL,
    realizada BOOLEAN NULL,
    id_cliente INT NOT NULL,
    id_clinica INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_clinica) REFERENCES clinica(id),
) ENGINE=InnoDB;

CREATE TABLE horario(
    id INT AUTO_INCREMENT,
    am_inicio TIME NOT NULL,
    am_fim TIME,
    pm_inicio TIME,
    pm_fim TIME NOT NULL,
    intervalo TIME NOT NULL,
    almoco BOOLEAN,
    dia_semana INT(1),
    id_clinica INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_clinica) REFERENCES clinica(id),
) ENGINE=InnoDB;

CREATE TABLE funcionario(
    id INT AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    id_clinica INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_clinica) REFERENCES clinica(id),
) ENGINE=InnoDB;
