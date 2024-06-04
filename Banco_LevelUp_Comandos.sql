CREATE DATABASE levelup;

USE levelup;

CREATE TABLE IF NOT EXISTS `chaves` (
	`cha_id` int AUTO_INCREMENT NOT NULL,
	`jog_id` int NOT NULL,
	`cha_chave` varchar(255) NOT NULL,
	PRIMARY KEY (`cha_id`)
);

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

CREATE TABLE IF NOT EXISTS `usuarios` (
	`usu_id` int AUTO_INCREMENT NOT NULL,
	`usu_nome` varchar(255) NOT NULL,
	`usu_email` varchar(255) NOT NULL,
	`usu_senha` varchar(255) NOT NULL,
	`usu_adm` bit(1) NOT NULL,
	PRIMARY KEY (`usu_id`)
);

CREATE TABLE IF NOT EXISTS `pedidos` (
	`ped_id` int AUTO_INCREMENT NOT NULL,
	`ped_data` datetime NOT NULL,
	`ped_preco` int NOT NULL,
	`ped_pago` bit(1) NOT NULL,
	`usu_id` int NOT NULL,
	PRIMARY KEY (`ped_id`)
);

CREATE TABLE IF NOT EXISTS `comentario` (
	`com_id` int AUTO_INCREMENT NOT NULL,
	`jog_id` int NOT NULL,
	`usu_id` int NOT NULL,
	`com_comentario` varchar(255) NOT NULL,
	`com_data` datetime NOT NULL,
	PRIMARY KEY (`com_id`)
);

CREATE TABLE IF NOT EXISTS `pedido_chaves` (
	`cha_id` int NOT NULL,
	`ped_id` int NOT NULL,
	PRIMARY KEY (`cha_id`)
);

ALTER TABLE `chaves` ADD CONSTRAINT `chaves_fk1` FOREIGN KEY (`jog_id`) REFERENCES `jogos`(`jog_id`);

ALTER TABLE `pedidos` ADD CONSTRAINT `pedidos_fk4` FOREIGN KEY (`usu_id`) REFERENCES `usuarios`(`usu_id`);
ALTER TABLE `comentario` ADD CONSTRAINT `comentario_fk1` FOREIGN KEY (`jog_id`) REFERENCES `jogos`(`jog_id`);

ALTER TABLE `comentario` ADD CONSTRAINT `comentario_fk2` FOREIGN KEY (`usu_id`) REFERENCES `usuarios`(`usu_id`);
ALTER TABLE `pedido_chaves` ADD CONSTRAINT `pedido_chaves_fk0` FOREIGN KEY (`cha_id`) REFERENCES `chaves`(`cha_id`);

ALTER TABLE `pedido_chaves` ADD CONSTRAINT `pedido_chaves_fk1` FOREIGN KEY (`ped_id`) REFERENCES `pedidos`(`ped_id`);

SELECT * FROM jogos;

SELECT usu_nome, usu_email FROM usuarios;

SELECT DISTINCT usu_adm FROM usuarios;

SELECT jog_titulo, jog_descricao, jog_preco FROM jogos WHERE jog_preco > 125;

SELECT * FROM comentario WHERE usu_id BETWEEN 2 AND 5;

SELECT * FROM jogos WHERE jog_descricao LIKE '%corrida%';
 
SELECT * FROM pedidos WHERE ped_pago = true AND ped_preco > 180;

SELECT * FROM pedidos WHERE ped_pago = false OR ped_preco > 200;

SELECT * FROM jogos WHERE NOT jog_plataforma = 'Nintendo Switch';

SELECT CONCAT_WS(' - ', usu_email, usu_senha) AS email_e_senha FROM usuarios;

SELECT * FROM comentario LIMIT 2,4;

SELECT usu_adm, COUNT(*) FROM usuarios GROUP BY usu_adm;

SELECT MAX(com_data) FROM comentario;

SELECT MIN(com_data) FROM comentario;

SELECT SUM(ped_preco) FROM pedidos;

SELECT jog_genero, AVG(jog_preco) as media_preco_classificacao FROM jogos GROUP BY jog_genero HAVING AVG(jog_preco) > 130;

SELECT com_comentario FROM comentario WHERE com_data > ANY (SELECT com_data FROM comentario WHERE usu_id > 3);

SELECT com_comentario FROM comentario WHERE com_data > ALL (SELECT com_data FROM comentario WHERE jog_id > 2 );

SELECT jog_titulo FROM jogos WHERE EXISTS (SELECT * FROM comentario WHERE usu_id = jogos.jog_id);

SELECT usu_nome FROM usuarios WHERE usu_email IS NULL;

SELECT jog_titulo FROM jogos WHERE jog_preco > (SELECT AVG(jog_preco) FROM jogos);

SELECT YEAR(com_data) AS ano, MONTH(com_data) AS mes, DAY(com_data) AS dia FROM comentario;

SELECT ped_id, ped_data, TIME_TO_SEC(ped_data) AS tempo_em_segundos FROM pedidos;

SELECT usu_nome, com_comentario FROM usuarios INNER JOIN comentario ON usuarios.usu_id = comentario.usu_id;

SELECT jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_preco, com_comentario FROM jogos LEFT JOIN comentario ON jogos.jog_id = comentario.jog_id;

SELECT usu_nome, ped_preco, ped_pago, ped_data FROM usuarios RIGHT JOIN pedidos ON usuarios.usu_id = pedidos.usu_id;