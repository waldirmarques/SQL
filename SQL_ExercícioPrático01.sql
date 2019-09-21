/*1) Crie a base de dados Clinica usando o comando CREATE DATABASE clinica.*/

CREATE DATABASE Clinica

/*2) Escreva os scripts de criação das tabelas Pacientes, Médicos e Consultas*/

CREATE TABLE Pacientes(
    ID_Paciente INT NOT NULL IDENTITY,
    nome VARCHAR(80) NOT NULL,
    cpf CHAR(12) NOT NULL,
    sexo CHAR(1) NOT NULL,
    idade INT NOT NULL,
    convenio VARCHAR(20) NOT NULL,

    PRIMARY KEY(ID_Paciente),
    UNIQUE(cpf),
    CHECK(sexo IN('M','F')),
    CHECK(idade > 0),
    CHECK(convenio IN('GEAP','unimed'))
)

CREATE TABLE Medicos(
    ID_Medico INT NOT NULL IDENTITY,
    nome  VARCHAR(80) NOT NULL,
    especialidade VARCHAR(30) NOT NULL,
    turno CHAR(10) NOT NULL,
    salario NUMERIC(6,3) NOT NULL,

    PRIMARY KEY(ID_Medico),
    CHECK(turno IN('Manhã','Tarde','Noite')),
    CHECK(salario > 0)
)

CREATE TABLE Consultas(
    ID_Consulta INT NOT NULL IDENTITY,
    ID_Paciente INT NOT NULL,
    ID_Medico INT NOT NULL,
    dataConsulta DATETIME NOT NULL,
    diagnostico VARCHAR(80) NOT NULL,
    preco NUMERIC(6,3) NOT NULL,

    PRIMARY KEY (ID_Consulta),
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes,
    FOREIGN KEY (ID_Medico) REFERENCES Medicos,
    CHECK(preco > 0)
)

/*3) De acordo com o esquema criado na questão anterior, escreva scripts para inserção de dados nessas tabelas (pelo
menos três registros em cada tabela).*/
INSERT INTO Pacientes VALUES('Waldir Marques','34235454523','M',21,'GEAP')
INSERT INTO Pacientes VALUES('Fernanda Silva','3432343332','F',18,'Unimed')
INSERT INTO Pacientes VALUES('Bruna Silva','25465323','F',19,'Unimed')

INSERT INTO Medicos VALUES('Francivaldo Napolião','Terapeuta','Manhã',20.000)
INSERT INTO Medicos VALUES('Emerson Ruan','Pediatra','Noite',25.000)
INSERT INTO Medicos VALUES('Emanuel Medeiros','Psicologo','Tarde',15.000)

INSERT INTO Consultas VALUES(1,1,'21-09-2019','Obezidade',32.90)
INSERT INTO Consultas VALUES(2,2,'23-09-2019','Pé quebrado',322.90)
INSERT INTO Consultas VALUES(3,3,'01-09-2019','Ansiedade',12.90)

/*4) Realize consultas simples utilizando o comando SELECT atributo FROM tabela.*/

SELECT nome FROM Pacientes
SELECT * FROM Pacientes

SELECT nome FROM Medicos
SELECT * FROM Medicos

SELECT * FROM Consultas

/*5) Atualize os salários dos médicos pediatras para que eles ganhem 10% mais.*/

UPDATE Medicos SET salario = salario + (0.1*salario) WHERE (especialidade = 'Pediatra')

/*6) Exclua da tabela consultas todas as que custaram menos de R$ 80.*/

DELETE FROM Consultas WHERE (preco > 80)

/*7) Altere a tabela consultas para incluir um campo horário.*/

ALTER TABLE Consultas ADD horario DATETIME
ALTER TABLE Consultas ADD CONSTRAINT horario CHECK(horario <> NULL)

/*8) Remova a tabela Consultas.*/
DROP TABLE Pacientes
DROP TABLE Medicos
DROP TABLE Consultas

/*9) Remova a base de dados Clinica.*/

DROP DATABASE Clinica