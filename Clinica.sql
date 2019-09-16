CREATE DATABASE clinica /*usado para criar um banco de dados*/ 

USE clinica /*Comando para usar o banco*/

/*
Criação das tabelas
*/

DROP TABLE Pacientes /*Apaga a tabela*/

CREATE TABLE Pacientes(
    ID_Paciente INT NOT NULL IDENTITY,
    nome VARCHAR(80) NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    sexo CHAR(1) NOT NULL,
    idade INT NOT NULL,
    convenio VARCHAR(10) NOT NULL,
	PRIMARY KEY (ID_Paciente),
	UNIQUE(cpf),
    CHECK(sexo IN('M','F')),
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
	FOREIGN KEY (ID_Paciente) REFERENCES pacientes,
    FOREIGN KEY (ID_Medico) REFERENCES medicos
)

/*
Insersão de dados para as tabelas


INSERT INTO pacientes(NULL,'Waldir Marques de Sousa','123.532.213-43','M',21,'Unimed'),
INSERT INTO pacientes("Fernanda Silva","432.342.233-42",'F',18,"GEAP"),
INSERT INTO pacientes("Bruna Medeiros","323.323.212-35",'F',19,"Unimed"),

INSERT INTO medicos("João medeiros","clinico geral",'tarde',20,000),
INSERT INTO medicos("Fernanddo Silva","cirurgião",'tarde',18,000),
INSERT INTO medicos("Bruna consauves Medeiros","noite",19,000)

INSERT INTO consultas("")
*/