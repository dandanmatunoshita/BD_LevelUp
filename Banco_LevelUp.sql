CREATE DATABASE levelup;

USE levelup;

CREATE TABLE IF NOT EXISTS comsumidores(
	id_consumidor INT NOT NULL AUTO_INCREMENT,
    id_endereco INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_consumidor)
);

CREATE TABLE IF NOT EXISTS comentarios(
	id_comentarios INT NOT NULL AUTO_INCREMENT,
    id_game INT NOT NULL,
    id_consumidor INT NOT NULL,
    PRIMARY KEY (id_comentarios)
);

CREATE TABLE IF NOT EXISTS endereco(
	id_endereco INT NOT NULL AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(100) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cep VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_endereco)
);

CREATE TABLE IF NOT EXISTS pedidoKeys(
	id_key INT NOT NULL AUTO_INCREMENT,
    id_pedidos INT NOT NULL,
    PRIMARY KEY (id_key)
);

CREATE TABLE IF NOT EXISTS chaves(
	id_key INT NOT NULL AUTO_INCREMENT,
    id_game INT NOT NULL,
    chave VARCHAR(255),
    PRIMARY KEY (id_key)
);

CREATE TABLE IF NOT EXISTS games(
	id_games INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    plataforma VARCHAR(100) NOT NULL,
    preco VARCHAR(100) NOT NULL,
    classificacao VARCHAR(100) NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_games)
);

CREATE TABLE IF NOT EXISTS pedidos(
	usu_id INT NOT NULL AUTO_INCREMENT,
    usu_name  VARCHAR(30) NOT NULL,
    usu_ativo BIT NOT NULL,
    PRIMARY KEY (usu_id)
);

CREATE TABLE IF NOT EXISTS usuarios(
	usu_id INT NOT NULL AUTO_INCREMENT,
    usu_name  VARCHAR(30) NOT NULL,
    usu_ativo BIT NOT NULL,
    PRIMARY KEY (usu_id)
);