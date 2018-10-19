-- Alunos matriculados
SELECT * FROM aluno;

-- Select professor disciplina
SELECT dis.nome, pro.nome
FROM turma_atividade_professor_disciplina as aula, disciplina as dis, professor as pro
WHERE aula.idProfessor = pro.idProfessor AND aula.idDisciplina = dis.idDisciplina; 

-- Select professor disciplina atividade
SELECT pro.nome, dis.nome, ativ.nome
FROM turma_atividade_professor_disciplina as aula, disciplina as dis, professor as pro, atividade as ativ
WHERE aula.idProfessor = pro.idProfessor AND aula.idDisciplina = dis.idDisciplina AND aula.idAtividade = ativ.idAtividade;

-- Atividade com nota
SELECT alu.nome, dis.nome, pro.nome, ativ.nome, aluativ.nota
FROM turma_atividade_professor_disciplina as aula, disciplina as dis, professor as pro, atividade as ativ, aluno as alu, aluno_atividade as aluativ, turma AS tur
WHERE aula.idProfessor = pro.idProfessor AND aula.idDisciplina = dis.idDisciplina AND aula.idAtividade = ativ.idAtividade AND aula.idTurma = tur.idTurma AND ativ.idAtividade = aluativ.idAtividade AND alu.idAluno = aluativ.idAluno AND alu.idTurma = tur.idTurma;


SELECT alu.nome, tur.idTurma, ativ.idAtividade, ativ.nome
FROM aluno AS alu, turma AS tur, atividade as ativ, aluno_atividade as aluativ
WHERE alu.idTurma = tur.idTurma AND alu.idAluno = aluativ.idAluno AND ativ.idAtividade = aluativ.idAtividade;

-- Insert Turma
INSERT INTO turma (nome, serie, periodo)
VALUES ("Z", 1, "Tarde");

-- Insert Aluno
INSERT INTO aluno (nome, endereco, telefone, email, nomeDaMae, idTurma)
VALUES ('Igor','Rua Castelo Branco, 300','98745-8120','igor@gmail.com','Rosa',2);

-- Insert Professor
INSERT INTO professor (nome, endereco, telefone, email, nomeDaMae)
VALUES ('Igor','Rua Castelo Branco, 300','98745-8120','igor@gmail.com','Rosa');

--Insert Atividade
INSERT INTO atividade (nome)
VALUES ("Prova");

--Insert Disciplina
INSERT INTO disciplina (nome)
VALUES ("Geografia");

--Insert Aluno_atividade
INSERT INTO aluno_atividade (idAluno, idAtividade, nota)
VALUES (2, 3, 4);

-- Insert turma_atividade_professor_disciplina
INSERT INTO turma_atividade_professor_disciplina (idProfessor, idTurma, idAtividade, idDisciplina, horario)
VALUES (1,2,3,4,"Segunda 18:00");
