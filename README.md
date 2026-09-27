# Banco de Dados Acadêmico
Modelo racional para gestão acadêmica contemplando turmas, alunos, professores, disciplinas e avalições.
# Sobre o projeto
Este repositório contém o script SQL/DDL de um banco de dados acadêmico desenvolvido como parte da disciplina Modelagem de Banco de Dados do curso de Engenharia de Software na UDF Centro Universitário. O modelo conceitual foi fornecido em aula, e a implementação (script DDL) foi feita a partir dele.
# Modelo de dados
O banco é composto pelas seguintes tabelas:
- CURSO
- TURMA 
- PROFESSOR
- DISCIPLINA
- PROF_TURM_DISC
- ALUNO
- ALUNO_TURMA
- FREQUENCIA
- PROVA
- AVALIACAO
# Relacionamentos principais:
- CURSO 1:N TURMA
- TURMA N:N PROFESSOR/DISCIPLINA via PROF_TURM_DISC
- ALUNO N:N TURMA via ALUNO_TURMA
- ALUNO regista FREQUENCIA por turma/disciplina/data
- ALUNO recebe AVALIACAO por turma/disciplina/prova
# Tecnologias utilizadas
- MySQL 8.0
- MySQL Workbench
# Como executar
1. Abra o MySQL Workbench e conecte-se ao seu servidor local
2. Abra o arquivo bd_academico.sql deste repositório
3. Execute o script completo (clicando no ícone de raio ou Crtl+Shift+Enter)
4. O banco academico será criado com todas as tabelas e relacionamentos
5. Execute o inserts.sql
# Autor
Vinícius Silva Rodrigues - (vinirodrigues-hub) - Estudante de Engenharia de Software - UDF Centro Universitário
# Licença
Projeto acadêmico, de uso educacional

