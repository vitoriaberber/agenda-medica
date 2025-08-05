SELECT p.nome, m.nome, to_char(c.data_consulta, 'DD/MM/YYYY')     data_marcada,
	c.hora_consulta, 
	c.observacoes FROM pacientes p JOIN consultas c ON
	p.id_paciente = c.id_paciente JOIN medicos m ON 
	m.id_medico = c.id_medico;

SELECT DISTINCT m.nome, 
	to_char(c.data_consulta, 'DD/MM/YYYY') data_marcada FROM 
	medicos m JOIN consultas c ON m.id_medico = c.id_medico
	WHERE c.data_consulta = '01/08/2025';

    SELECT DISTINCT p.nome, 
        to_char(c.data_consulta, 'DD/MM/YYYY') data_marcada FROM 
        pacientes p JOIN consultas c ON p.id_paciente = c.id_paciente
        WHERE c.data_consulta = '01/08/2025';

SELECT p.nome, m.nome, c.hora_consulta
	FROM pacientes p JOIN consultas c ON
	p.id_paciente = c.id_paciente JOIN medicos m ON 
	m.id_medico = c.id_medico
	WHERE c.hora_consulta BETWEEN '10:00:00' AND '12:00:00';

SELECT m.nome, COUNT(c.id_consulta) consultas FROM
	medicos m JOIN consultas c ON m.id_medico = c.id_medico
	GROUP BY m.nome;

SELECT p.nome, COUNT(c.id_consulta) consultas FROM
	pacientes p JOIN consultas c ON p.id_paciente = c.id_paciente
	GROUP BY p.nome;

SELECT p.nome, m.nome, to_char(c.data_consulta, 'DD/MM/YYYY') data_marcada,
	c.hora_consulta, 
	c.observacoes FROM pacientes p JOIN consultas c ON
	p.id_paciente = c.id_paciente JOIN medicos m ON 
	m.id_medico = c.id_medico
	WHERE c.data_consulta = '01/08/2025';

SELECT * FROM consultas 
	WHERE id_medico = 1 
	AND data_consulta = '2025-08-01' 
	AND hora_consulta = '09:00';

SELECT p.nome AS paciente, m.nome AS medico, c.data_consulta, c.hora_consulta, c.observacoes FROM  consultas c
	JOIN pacientes p ON c.id_paciente = p.id_paciente
	JOIN medicos m ON c.id_medico = m.id_medico
	WHERE p.nome = 'Amanda Ribeiro'
	ORDER BY c.data_consulta, c.hora_consulta;

SELECT m.especialidade, COUNT(c.id_consulta) AS total_consultas
	FROM  medicos m JOIN consultas c ON m.id_medico = c.id_medico
	GROUP BY m.especialidade
	ORDER BY total_consultas DESC;	