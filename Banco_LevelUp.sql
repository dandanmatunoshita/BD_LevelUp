CREATE DATABASE levelup;

USE levelup;

CREATE TABLE IF NOT EXISTS `chaves` (
	`cha_id` int AUTO_INCREMENT NOT NULL,
	`jog_id` int NOT NULL,
	`cha_chave` varchar(255) NOT NULL,
	PRIMARY KEY (`cha_id`)
);

INSERT INTO chaves (jog_id, cha_chave) VALUES (1, "N7K4-J8M2-W5Z3-Y1P9");
INSERT INTO chaves (jog_id, cha_chave) VALUES (2, "G3L6-T2B8-H4N9-Q7X5");
INSERT INTO chaves (jog_id, cha_chave) VALUES (3, "F9D2-W1K5-R3Z8-L7M4");
INSERT INTO chaves (jog_id, cha_chave) VALUES (4, "A5H3-Y9X1-V2N7-M8Q4");
INSERT INTO chaves (jog_id, cha_chave) VALUES (5, "P4M9-G7L2-B3T6-X1N5");
INSERT INTO chaves (jog_id, cha_chave) VALUES (6, "Z8W1-R5J2-K3M7-Q4N9");

SELECT * FROM chaves;

CREATE TABLE IF NOT EXISTS `jogos` (
	`jog_id` int AUTO_INCREMENT NOT NULL,
	`jog_titulo` varchar(255) NOT NULL,
	`jog_descricao` varchar(255) NOT NULL,
	`jog_genero` varchar(255) NOT NULL,
	`jog_plataforma` varchar(255) NOT NULL,
	`jog_classificacao` varchar(3) NOT NULL,
	`jog_preco` int NOT NULL,
	PRIMARY KEY (`jog_id`)
);

INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Forza Horizon 5", "jogo de corrida de mundo aberto", "corrida", "pc e xbox", "12", 149.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Forza Horizon 4", "jogo de corrida de mundo aberto", "corrida", "pc e xbox", "10", 99.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Horizon Zero Down", "jogo de aventura de mundo aberto", "aventura", "pc, PS4 e PS5", "16", 129.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("The Last Of Us", "jogo de sobrevivencia de mundo aberto", "aventura", "pc, PS4 e PS5", "16", 119.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Mario Kart 8", "jogo de corrida", "corrida", "Nintendo Switch", "L", 249.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("The Legend Of Zelda", "jogo de aventura de mundo aberto", "aventura", "Nintendo Switch", "L", 249.90);

SELECT * FROM jogos;

CREATE TABLE IF NOT EXISTS `usuarios` (
	`usu_id` int AUTO_INCREMENT NOT NULL,
	`usu_nome` varchar(255) NOT NULL,
	`usu_email` varchar(255) NOT NULL,
	`usu_senha` varchar(255) NOT NULL,
	`usu_adm` bit(1) NOT NULL,
	PRIMARY KEY (`usu_id`)
);

INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_adm) VALUES ("joao", "joao@gmail.com", "joao1234", true);
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_adm) VALUES ("carlos", "carlos@gmail.com", "carlos1234", false);
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_adm) VALUES ("pedro", "pedro@gmail.com", "pedro1234", false);
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_adm) VALUES ("bia", "bia@gmail.com", "bia1234", true);
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_adm) VALUES ("julia", "julia@gmail.com", "julia1234", false);
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_adm) VALUES ("ana", "ana@gmail.com", "ana1234", false);

SELECT * FROM usuarios;

CREATE TABLE IF NOT EXISTS `pedidos` (
	`ped_id` int AUTO_INCREMENT NOT NULL,
	`ped_data` datetime NOT NULL,
	`ped_preco` int NOT NULL,
	`ped_pago` bit(1) NOT NULL,
	`usu_id` int NOT NULL,
	PRIMARY KEY (`ped_id`)
);

INSERT INTO pedidos (ped_data, ped_preco, ped_pago, usu_id) VALUES ("2015-02-15 13:45:22", 149.90, true, 1);
INSERT INTO pedidos (ped_data, ped_preco, ped_pago, usu_id) VALUES ("2016-03-27 14:32:11", 99.90, false, 2);
INSERT INTO pedidos (ped_data, ped_preco, ped_pago, usu_id) VALUES ("2017-04-18 15:23:19", 129.90, true, 3);
INSERT INTO pedidos (ped_data, ped_preco, ped_pago, usu_id) VALUES ("2018-05-16 16:58:33", 119.90, false, 4);
INSERT INTO pedidos (ped_data, ped_preco, ped_pago, usu_id) VALUES ("2019-06-24 17:47:55", 249.90, true, 5);
INSERT INTO pedidos (ped_data, ped_preco, ped_pago, usu_id) VALUES ("2020-07-13 18:36:44", 249.90, false, 6);

SELECT * FROM pedidos;

CREATE TABLE IF NOT EXISTS `comentario` (
	`com_id` int AUTO_INCREMENT NOT NULL,
	`jog_id` int NOT NULL,
	`usu_id` int NOT NULL,
	`com_comentario` varchar(255) NOT NULL,
	`com_data` datetime NOT NULL,
	PRIMARY KEY (`com_id`)
);

INSERT INTO comentario (jog_id, usu_id, com_comentario, com_data) VALUES (1, 1, "melhor jogo de corrida", "2024-01-01 12:00:00");
INSERT INTO comentario (jog_id, usu_id, com_comentario, com_data) VALUES (2, 3, "melhor jogo de corrida antigo", "2023-02-05 18:10:15");
INSERT INTO comentario (jog_id, usu_id, com_comentario, com_data) VALUES (3, 5, "jogo de aventura legal", "2022-03-10 22:11:16");
INSERT INTO comentario (jog_id, usu_id, com_comentario, com_data) VALUES (4, 6, "foi dificil sobreviver nesse jogo", "2021-04-15 03:12:17");
INSERT INTO comentario (jog_id, usu_id, com_comentario, com_data) VALUES (5, 4, "melhor jogo de corrida para os consoles da nintendo", "2020-05-20 07:13:18");
INSERT INTO comentario (jog_id, usu_id, com_comentario, com_data) VALUES (6, 2, "o boss final foi desafiador", "2019-06-25 10:14:19");

SELECT * FROM comentario;

CREATE TABLE IF NOT EXISTS `pedido_chaves` (
	`cha_id` int NOT NULL,
	`ped_id` int NOT NULL,
	PRIMARY KEY (`cha_id`)
);

INSERT INTO pedido_chaves (cha_id, ped_id) VALUES (1,1);
INSERT INTO pedido_chaves (cha_id, ped_id) VALUES (2,2);
INSERT INTO pedido_chaves (cha_id, ped_id) VALUES (3,3);
INSERT INTO pedido_chaves (cha_id, ped_id) VALUES (4,4);
INSERT INTO pedido_chaves (cha_id, ped_id) VALUES (5,5);
INSERT INTO pedido_chaves (cha_id, ped_id) VALUES (6,6);

SELECT * FROM pedido_chaves;

ALTER TABLE `chaves` ADD CONSTRAINT `chaves_fk1` FOREIGN KEY (`jog_id`) REFERENCES `jogos`(`jog_id`);


ALTER TABLE `pedidos` ADD CONSTRAINT `pedidos_fk4` FOREIGN KEY (`usu_id`) REFERENCES `usuarios`(`usu_id`);
ALTER TABLE `comentario` ADD CONSTRAINT `comentario_fk1` FOREIGN KEY (`jog_id`) REFERENCES `jogos`(`jog_id`);

ALTER TABLE `comentario` ADD CONSTRAINT `comentario_fk2` FOREIGN KEY (`usu_id`) REFERENCES `usuarios`(`usu_id`);
ALTER TABLE `pedido_chaves` ADD CONSTRAINT `pedido_chaves_fk0` FOREIGN KEY (`cha_id`) REFERENCES `chaves`(`cha_id`);

ALTER TABLE `pedido_chaves` ADD CONSTRAINT `pedido_chaves_fk1` FOREIGN KEY (`ped_id`) REFERENCES `pedidos`(`ped_id`);
