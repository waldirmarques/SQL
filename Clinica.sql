CREATE DATABASE Clinica /*usado para criar um banco de dados*/ 

USE clinica /*Comando para usar o banco*/

/*
Criação das tabelas
*/

DROP TABLE Pacientes /*Apaga a tabela*/

CREATE TABLE Pacientes(
    ID_Paciente INT NOT NULL IDENTITY, /*NOT NULL -> indica que é obrigatorio e deve ser informado durante a inserção
										 IDENTIFY -> indica que o atributo será automaticamente incrementado
										 DEFAULT -> coloca um valor definido no atributo*/
    nome VARCHAR(80) NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    sexo CHAR(1) NOT NULL,
    idade INT NOT NULL,
    convenio VARCHAR(10) NOT NULL,
	PRIMARY KEY (ID_Paciente), /*PRIMARY KEY -> indica a chave primaria*/
	UNIQUE(cpf), /*UNIQUE -> indica que o atributo não pode ter valores repitidos*/
    CHECK(sexo IN('M','F')), /*Indica regras para o preenchimento de um atributo. Quando for uma lista, colocar o IN*/
	CHECK(idade > 0),
	CHECK(convenio IN ('GEAP', 'Unimed'))
)

DROP TABLE Medicos /*Apaga a tabela*/

CREATE TABLE Medicos(
    ID_Medico INT NOT NULL IDENTITY,
    nome VARCHAR(80) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    salario NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (ID_Medico),
	CHECK(turno IN ('Manhã','Tarde','Noite')),
	CHECK(salario > 0)
)

DROP TABLE Consultas /*Apaga a tabela*/

CREATE TABLE Consultas(
    ID_Consulta INT NOT NULL IDENTITY,
	ID_Paciente INT NOT NULL,
	ID_Medico INT NOT NULL,
    dataConsulta DATETIME NOT NULL,
    diagnostico VARCHAR(100) NOT NULL,
    preco NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (ID_Consulta),
	FOREIGN KEY (ID_Paciente) REFERENCES Pacientes,
    FOREIGN KEY (ID_Medico) REFERENCES Medicos
)

/*
Insersão de dados para as tabelas
*/

/*INSERT INTO Pacientes VALUES ('Natália Matos', '1248735', 'F', 30, 'GEAP') -> Inserção dos atuibutos para Pacientes*/

INSERT INTO Pacientes VALUES ('Waldir Marques de Sousa','12353221343','M',21,'Unimed')
INSERT INTO Pacientes (nome, cpf,sexo,idade,convenio) VALUES ('Francivaldo Napoleão','2414124','M',22,'GEAP')
INSERT INTO Pacientes VALUES('Fernanda Silva','43234223342','F',18,'GEAP')
INSERT INTO Pacientes VALUES('Bruna Medeiros','32332321235','F',19,'Unimed')

/*INSERT INTO Medicos VALUES ('José Geraldo', 'Cardiologista', 'Manhã', 5000) -> Inserção dos atuibutos para Medicos*/

INSERT INTO Medicos VALUES('João medeiros','clinico geral','tarde',2000)
INSERT INTO Medicos (nome,especialidade,turno,salario) VALUES ('Ricardo Bosco','cardiologista','noite',332.43)
INSERT INTO Medicos VALUES('Fernanddo Silva','cirurgião','tarde',1800)
INSERT INTO Medicos VALUES('Bruna consauves Medeiros','desvio na coluna','noite',1900)

/*INSERT INTO Consultas VALUES (1, 4, '2014-10-19', 'Depressão', 75.90) -> Inserção dos atuibutos para Consultas*/

INSERT INTO Consultas VALUES(1,5,'23-05-2019','pedra na vezicula',20.90)
INSERT INTO Consultas VALUES(3,7,'12-09-2018','arritimia cardiaca',21.90)
INSERT INTO Consultas VALUES(4,6,'25-01-2019','resfriado',532.32)


SELECT nome FROM Pacientes /*Mostra a tabela de nomes dos pacientes*/
SELECT * FROM Pacientes /*Mostra toda a tabela de pacientes*/

SELECT nome FROM Medicos
SELECT * FROM Medicos

SELECT * FROM Consultas

/*
Atualização dos dados de uma tabela
*/

UPDATE Medicos SET especialidade = 'pediatra' WHERE (especialidade = 'desvio na coluna') /*Atualiza um dado da coluna usando uma condição*/
UPDATE Medicos SET turno ='noite' /*Atualiza todos os valores de uma atributo em uma tabela*/

UPDATE Medicos SET salario = salario +(0.1 * salario) WHERE (especialidade = 'pediatra')

/*
Deletar uma tabela ou apenas dados da mesma
*/

DROP TABLE test
CREATE TABLE test(
	nome VARCHAR(90) NOT NULL,
	tipo INT NOT NULL
)
INSERT INTO test VALUES('TESTANDO USSONFAGNAORMG',432)
SELECT * FROM test

DELETE FROM test  /*Deleta os atributos da tabela*/

DELETE FROM Consultas WHERE (preco > 80) /*Deleta atributos de uma tabela seguindo uma condição*/


/*
Alterar a estrutura de uma tabela
*/

ALTER TABLE Consultas ADD horario DATETIME /*Adiciona um atributo a uma tabela*/
ALTER TABLE Consultas DROP COLUMN horario /*Remove um atributo de uma tabela*/

ALTER TABLE Consultas ADD CONSTRAINT horario CHECK(horario != NULL) /*Adiciona um atributo a uma tabela com uma restrição*/
ALTER TABLE Consultas DROP CONSTRAINT horario /*Remove um atributo de uma tabela com uma restrição*/

DROP DATABASE Clinica /*Deleta todo o banco de dados*/


SELECT genero, SUM(precoCusto)
FROM Livros
GROUP BY genero