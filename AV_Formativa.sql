CREATE DATABASE AV_Formativa;
USE AV_Formativa;

CREATE TABLE Universidade (
	id_uni integer primary key auto_increment,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(100),
	estado VARCHAR(100),
    cidade VARCHAR(100),
	bairro VARCHAR(100),
	rua VARCHAR(100),
	numero INT
);
    
CREATE TABLE Estudante (
	id_estudante integer primary key auto_increment,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(100),
	estado VARCHAR(100),
	cidade VARCHAR(100),
	bairro VARCHAR(100),
	rua VARCHAR(100),
    numero INT,
	id_uni INT,
    FOREIGN KEY (id_uni) REFERENCES Universidade(id_uni)
);
        
INSERT INTO Universidade (nome, telefone, estado, cidade, bairro, rua, numero)
values
	('Harvard University', '+1 617-495-1000', 'MA', 'Cambridge', 'Harvard Square', 'Massachusetts Ave', 1350),
	('University of Oxford', '+44 1865 270000', 'Oxfordshire', 'Oxford', 'Central Oxford', 'High Street', 50),
	('University of Tokyo', '+81 3-5841-2102', 'Tokyo', 'Tokyo', 'Bunkyo', 'Hongo', 7),
	('University of Melbourne', '+61 3 9035 5511', 'Victoria', 'Melbourne', 'Parkville', 'Swanston St', 240),
	('ETH Zurich', '+41 44 632 1111', 'Zurich', 'Zurich', 'Zentrum', 'Rämistrasse', 101);
   
INSERT INTO Estudante (nome, telefone, estado, cidade, bairro, rua, numero, id_uni)
values
	('Ana Silva', '(11) 91234-5678', 'SP', 'São Paulo', 'Pinheiros', 'Rua dos Estudantes', 101, 1),
	('Giovanna', '(21) 98765-4321', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', 505, 1),
	('Melissa', '(31) 99876-5432', 'MG', 'Belo Horizonte', 'Centro', 'Rua da Aprendizagem', 300, 5),
	('Gabriel', '(51) 97654-3210', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua dos Acadêmicos', 85, 4),
	('Giulia', '(61) 96543-2109', 'DF', 'Brasília', 'Asa Sul', 'SQN 405', 20, 3);
SELECT * FROM Universidade;
SELECT * FROM Estudante;
    
UPDATE Estudante
SET nome = "Giovanna"
WHERE id_estudante = 1;
    
UPDATE universidade
SET nome = "UTK"
WHERE id_uni = 3;
    
DELETE FROM estudante
WHERE id_estudante = 5;
    
CREATE view vw_universidade_e_alunos AS 
SELECT 
	universidade.nome AS Nome_da_Universidade,
	estudante.nome AS Nome_do_Estudante
FROM estudante
INNER JOIN universidade ON estudante.id_estudante = universidade.id_uni;
