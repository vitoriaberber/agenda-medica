# 🩺 Agenda Médica - Projeto PostgreSQL

Este projeto simula o sistema de agendamento de consultas médicas, utilizando banco de dados relacional com PostgreSQL. Ele contempla cadastro de pacientes, médicos e agendamentos, com **restrições de integridade**, **verificações de horário** e **consultas SQL úteis para relatórios**.

---

## 🧱 Estrutura do Banco de Dados

### 📌 Tabelas criadas:

#### `pacientes`
- `id_paciente` (PK)
- `nome`
- `data_nascimento`
- `telefone`

#### `medicos`
- `id_medico` (PK)
- `nome`
- `especialidade`
- `crm` (único)

#### `consultas`
- `id_consulta` (PK)
- `id_paciente` (FK)
- `id_medico` (FK)
- `data_consulta`
- `hora_consulta` (CHECK: entre 08:00 e 18:00)
- `observacoes`

✅ Restrição: **`UNIQUE (id_medico, data_consulta, hora_consulta)`**  
👉 Garante que um médico não tenha dois pacientes no mesmo horário.

---

## 💾 Inserções de Dados

- 5 pacientes cadastrados
- 3 médicos cadastrados com especialidades diferentes
- 10 consultas agendadas com horários variados e sem conflitos

---

## 📊 Consultas SQL (Relatórios)

Algumas das queries implementadas:

- **Listar todas as consultas agendadas com nome do paciente e médico**
- **Listar médicos com atendimentos em uma data específica**
- **Listar pacientes com consultas em um dia**
- **Consultar agenda entre horários (ex: 10h e 12h)**
- **Contar número de consultas por médico**
- **Contar número de consultas por paciente**
- **Listar todas as consultas marcadas para uma data específica**

---

## ✅ Regras de Negócio Aplicadas

- Médicos não podem ter **duas consultas no mesmo horário**.
- Consultas só podem ser marcadas **entre 08:00 e 18:00**.
- Integração entre tabelas com **chaves estrangeiras** e **restrições de unicidade**.

---

## 🛠️ Tecnologias

- PostgreSQL
- SQL puro (DDL + DML + SELECTs)
- PGAdmin ou psql para execução

---

## 👩‍💻 Desenvolvido por

**Vitória Berber**  
[GitHub](https://github.com/vitoriaberber)

---

