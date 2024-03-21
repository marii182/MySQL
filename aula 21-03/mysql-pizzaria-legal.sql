CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
    );
    
CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT,
    nome_pizza VARCHAR(255) NOT NULL,
    tamanho VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(255),
    preco DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (id)
    );
    
    SELECT * FROM tb_categorias;
     SELECT * FROM tb_pizzas;
     
     ALTER TABLE tb_pizzas ADD categoriaid BIGINT;
     
ALTER TABLE tb_pizzas ADD CONSTRAINT fk_categorias_pizzas
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Doce', 'Pizzas com ingredientes doces como chocolate, frutas e creme.'),
('Salgada', 'Pizzas tradicionais com ingredientes como queijo, molho de tomate e carnes.'),
('Vegetariana', 'Pizzas sem carne, com vegetais frescos e queijo derretido.'),
('Especial', 'Pizzas especiais com combinações únicas de ingredientes.'),
('Especiarias', 'Pizzas com ingredientes exóticos e temperos diferentes.');

INSERT INTO tb_pizzas (nome_pizza, tamanho, ingredientes, preco, categoriaid)
VALUES
('Margherita', 'Média', 'Molho de tomate, mussarela, manjericão', 45.99, 2), 
('Calabresa', 'Grande', 'Molho de tomate, calabresa, cebola, mussarela', 62.50, 2), 
('Chocolate', 'Pequena', 'Chocolate, morangos, creme', 108.75, 1), 
('Vegetariana', 'Média', 'Molho de tomate, pimentão, cebola, champignon, azeitona, mussarela', 47.00, 3), 
('Frango Catupiry', 'Grande', 'Molho de tomate, frango desfiado, catupiry, milho', 35.80, 2), 
('Banana Canela', 'Pequena', 'Banana, canela, leite condensado', 80.50, 1), 
('Portuguesa', 'Média', 'Molho de tomate, presunto, ovo, cebola, azeitona, mussarela', 49.75, 2), 
('Especial da Casa', 'Grande', 'Molho de tomate, calabresa, bacon, champignon, cebola, pimentão, mussarela', 138.90, 4); 

ALTER TABLE tb_pizzas MODIFY preco DECIMAL(10,2);

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE "%c%";

SELECT nome_pizza, tamanho, ingredientes, preco, tb_categorias.nome_categoria
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoriaid = tb_categorias.id;

SELECT nome_pizza, tamanho, ingredientes, preco, tb_categorias.nome_categoria
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.nome_categoria = "Doce";




