CREATE DATABASE db_colaboradores;

USE db_colaboradores;

CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario INT(7.2) NOT NULL,
    dataadmissao DATE NOT NULL,
    PRIMARY KEY (id)
    );
    
    INSERT INTO tb_colaboradores(nome, cargo, salario, dataadmissao)
    VALUES ("José Alves", "Ajudante", 2300.00, "2022-03-05"),
    ("Geronimo Macedo", "Engenheiro", 15000.00, "2009-07-03"),
    ("Luiza Belmonte", "Arquiteta", 7000.00, "2024-08-09"),
    ("João Anjos", "Carpinteiro", 3000.00, "2019-05-02"),
    ("Antonio Okahama", "Mestre de Obras", 4000.00, "2014-04-03");
    
   SELECT * FROM tb_colaboradores;
   
   ALTER TABLE tb_colaboradores MODIFY salario DECIMAL(7,2);
   
   SELECT nome, salario FROM tb_colaboradores WHERE salario > 2000;
   
    SELECT nome, salario FROM tb_colaboradores WHERE salario < 2000;
    
    UPDATE tb_colaboradores SET salario = 1500.00 WHERE id = 1;
    