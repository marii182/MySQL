CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    habilidades VARCHAR(255),
    PRIMARY KEY (id)
    );
    
    CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT,
    nome_personagem VARCHAR(255) NOT NULL,
    nivel INT NOT NULL,
    pontos_vida DECIMAL(3,1),
    PRIMARY KEY (id)
    );
    
    ALTER TABLE tb_classes CHANGE nome nome_classe VARCHAR(255) NOT NULL; 
    
    SELECT * FROM tb_classes;
    
ALTER TABLE tb_personagens ADD classeid BIGINT;

SELECT * FROM tb_personagens;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_classe_personagem
FOREIGN KEY (classeid) REFERENCES tb_classes (id);

INSERT INTO tb_classes (nome_classe, habilidades) VALUES
("Guerreiro", "Ataque Físico, Defesa, Resistência"),
("Mago", "Magia Elemental, Teletransporte, Cura"),
("Ladrão", "Furtividade, Roubo, Esquiva"),
("Arqueiro", "Ataque à Distância, Precisão, Camuflagem"),
("Caçador", "Rastreamento de Presas, Armadilhas, Precisão com Armas à Distância");

ALTER TABLE tb_personagens ADD poder_ataque INT;
ALTER TABLE tb_personagens ADD poder_defesa INT;

ALTER TABLE tb_personagens DROP pontos_vida;

ALTER TABLE tb_personagens
MODIFY classeid BIGINT AFTER poder_defesa;

INSERT INTO tb_personagens (nome_personagem, nivel, poder_ataque, poder_defesa, classeid) VALUES
("Aeronauta_Barata", 10, 50, 30, 1),
("Alce_Barbudo", 12, 60, 20, 2),
("Amado_Amoroso", 8, 40, 10, 3),
("Asteróide", 11, 55, 25, 4),
("Bizarro", 9, 45, 15, 5),
("Colapso", 13, 70, 25, 2),
("Dezencio", 10, 50, 30, 1),
("Esparadrapo", 8, 38, 12, 4);

UPDATE tb_personagens SET poder_ataque = 3000, poder_defesa = 1200 WHERE id = 8;

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT @@collation_database;

SELECT * FROM tb_personagens WHERE nome_personagem LIKE "%c%";

SELECT nome_personagem, nivel, poder_ataque, poder_defesa, tb_classes.nome_classe
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classeid = tb_classes.id;

SELECT nome_personagem, nivel, poder_ataque, poder_defesa, tb_classes.nome_classe
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classeid = tb_classes.id
WHERE tb_classes.nome_classe = "Arqueiro";


    