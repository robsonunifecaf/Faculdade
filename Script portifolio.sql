CREATE DATABASE db_faculdade;
USE db_faculdade;


-- Tabela Aluno
CREATE TABLE tbl_aluno (
    id_aluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) 
);

-- Tabela Curso
CREATE TABLE tbl_curso (
    id_curso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Disciplina
CREATE TABLE tbl_disciplina (
    id_disciplina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_curso INT NOT NULL,
    CONSTRAINT fk_curso_disciplina
    FOREIGN KEY (id_curso) REFERENCES tbl_curso(id_curso)
);

-- Tabela Professor
CREATE TABLE tbl_professor (
    id_professor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Turma
CREATE TABLE tbl_turma (
    id_turma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ano YEAR NOT NULL,
    semestre INT NOT NULL,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    id_aluno INT NOT NULL,
    CONSTRAINT fk_disciplina_turma
    FOREIGN KEY (id_disciplina) REFERENCES tbl_disciplina(id_disciplina),
    CONSTRAINT fk_professor_turma
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id_professor),
    CONSTRAINT fk_aluno_turma
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id_aluno)
);

-- Tabela Nota
CREATE TABLE tbl_nota (
    id_nota INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota DECIMAL(4, 2) NOT NULL,
    CONSTRAINT fk_aluno_nota
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id_aluno),
    CONSTRAINT fk_disciplina_nota
    FOREIGN KEY (id_disciplina) REFERENCES tbl_disciplina(id_disciplina)
);