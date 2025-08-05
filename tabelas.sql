CREATE DATABASE agenda_medica;
CREATE TABLE pacientes(
	id_paciente SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(100) NOT NULL
);

INSERT INTO pacientes (nome, data_nascimento, telefone) VALUES 
('Amanda Ribeiro', '1990-05-20', '11988887777'),
('Bruno Oliveira', '1985-09-15', '11997776666'),
('Camila Santos', '2001-02-03', '11996665555'),
('Daniel Costa', '1995-07-11', '11995554444'),
('Eduarda Lima', '1988-11-25', '11994443333');

CREATE TABLE medicos(
	id_medico SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	especialidade VARCHAR(255) NOT NULL,
	crm VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO medicos (nome, especialidade, crm) VALUES
('Dr. João Almeida', 'Clínico Geral', 'CRM123456'),
('Dra. Fernanda Souza', 'Dermatologia', 'CRM654321'),
('Dr. Lucas Martins', 'Pediatria', 'CRM789123');

CREATE TABLE consultas(
	id_consulta SERIAL PRIMARY KEY,
	id_paciente INTEGER NOT NULL REFERENCES pacientes(id_paciente),
	id_medico INTEGER NOT NULL REFERENCES medicos(id_medico),
	data_consulta DATE NOT NULL,
	hora_consulta TIME NOT NULL 
		CHECK (hora_consulta >= '08:00:00' 
		AND hora_consulta <= '18:00:00'),
	observacoes TEXT,
	UNIQUE (id_medico, data_consulta, hora_consulta)
);

INSERT INTO consultas (id_paciente, id_medico, data_consulta, 
hora_consulta, observacoes) VALUES
(1, 1, '2025-08-01', '09:00', 'Consulta de rotina'),
(2, 1, '2025-08-01', '10:00', 'Revisão de exames'),
(3, 2, '2025-08-01', '11:00', 'Consulta dermatológica'),
(4, 3, '2025-08-02', '08:30', 'Primeira consulta pediátrica'),
(5, 2, '2025-08-02', '09:30', 'Acompanhamento de tratamento'),
(1, 3, '2025-08-03', '10:00', 'Check-up geral'),
(2, 1, '2025-08-03', '11:00', 'Consulta de retorno'),
(3, 2, '2025-08-04', '08:00', 'Avaliação de pele'),
(4, 3, '2025-08-04', '09:00', 'Consulta pediátrica'),
(5, 1, '2025-08-04', '10:00', 'Dores musculares');