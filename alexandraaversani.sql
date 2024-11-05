CREATE DATABASE gestao;
\c gestao;

CREATE TABLE Pacientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255)
);

CREATE TABLE Medicos (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

CREATE TABLE Consultas (
    id INT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_consulta DATE,
    FOREIGN KEY (paciente_id)
    REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id)
    REFERENCES Medicos(id)
);

INSERT INTO Pacientes (id, nome, data_nascimento, endereco) VALUES
(1, 'Ana Silva', '1985-05-10', 'Rua A, 123'),
(2, 'Bruno Lima', '1990-08-21', 'Rua B, 456'),
(3, 'Carlos Souza', '1982-12-05', 'Rua C, 789');

INSERT INTO Medicos (id, nome, especialidade) VALUES
(1, 'Dr. João Mendes', 'Cardiologia'),
(2, 'Dra. Maria Fonseca', 'Dermatologia'),
(3, 'Dr. Pedro Santos', 'Pediatria');

INSERT INTO Consultas (id, paciente_id, medico_id, data_consulta) VALUES
(1, 1, 1, '2024-10-20'),
(2, 2, 1, '2024-10-22'),
(3, 1, 2, '2024-10-25');

SELECT Pacientes.nome AS nome_paciente, Medicos.nome AS nome_medico, Consultas.data_consulta, Medicos.especialidade
FROM Consultas
JOIN Pacientes ON Consultas.paciente_id = Pacientes.id
JOIN Medicos ON Consultas.medico_id = Medicos.id;

SELECT Pacientes.nome AS nome_paciente, Consultas.data_consulta, Medicos.nome AS nome_medico
FROM Pacientes
LEFT JOIN Consultas ON Pacientes.id = Consultas.paciente_id
LEFT JOIN Medicos ON Consultas.medico_id = Medicos.id;

SELECT Medicos.nome AS nome_medico, Medicos.especialidade
FROM Medicos
LEFT JOIN Consultas ON Medicos.id = Consultas.medico_id
WHERE Consultas.id IS NULL;


