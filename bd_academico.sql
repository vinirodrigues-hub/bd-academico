CREATE DATABASE ACADEMICO;
use ACADEMICO;

create table CURSO
(
	CO_CURSO INT NOT NULL,
    NOME VARCHAR(40) NULL
);

alter table CURSO 
add constraint PK_CURSO primary key (CO_CURSO);

create table TURMA
(
	CO_TURMA CHAR(11) NOT NULL,
    ANO CHAR(4) NULL,
    PERIODO CHAR(1) NULL,
    DESCRICAO varchar(50) null,
    DT_INICIAL datetime null,
    DT_FINAL datetime null,
    NUM_PROVAS int null,
    CO_CURSO int null
);

alter table TURMA
add constraint PK_TURMA primary key (CO_TURMA);

alter table TURMA 
add constraint REL_TURMA foreign key (CO_CURSO)
references CURSO(CO_CURSO);

create table ALUNO 
(
	CO_ALUNO int not null,
    DT_NASCIMENTO datetime null,
    SG_SEXO char(1) null,
    NOME varchar(20) null,
    CO_ESTADOCIVIL char(1) null,
    NO_PAI varchar(70) null,
    NO_MAE varchar(70) null
);

alter table ALUNO 
add constraint PK_ALUNO primary key (CO_ALUNO);

create table ALUNO_TURMA
(
	CO_ALUNO int not null,
    CO_TURMA char(11) not null,
    DT_MATRICULA datetime null,
    DT_CANCELAMENTO datetime null
);

alter table ALUNO_TURMA 
add constraint PK_ALUNOTURMA primary key (CO_ALUNO, CO_TURMA);

alter table ALUNO_TURMA
add constraint REL_ALUNOTURMA foreign key (CO_ALUNO)
references ALUNO(CO_ALUNO);

alter table ALUNO_TURMA
add constraint FK_ALUNOTURMA foreign key (CO_TURMA)
references TURMA(CO_TURMA);

create table FORNECEDOR
(
	CNPJ_FORNECEDOR integer not null,
    RAZAO_SOCIAL varchar(40) not null,
    NOME_FANTASIA varchar(40) not null,
    END_FORNECEDOR varchar(200) null,
    EMAIL_FORNECEDOR varchar(50) null,
    TELEFONE_FORNECEDOR char(15) null,
    PESSOA_CONTATO char(20) null
);
alter table FORNECEDOR
add constraint PK_FORN primary key (CNPJ_FORNECEDOR);

create table PEDIDO_COMPRA
(
	NRO_PEDIDO 	integer not null,
    CNPJ_FORNECEDOR integer null,
    DTHORA_EMISSAO datetime not null,
    FORMA_PGTO varchar(30) null,
    QTD_PARCELAS integer null,
    ALIQ_DESCONTO decimal(4,1) null
);
alter table PEDIDO_COMPRA
add constraint PK_COMPRA primary key (NRO_PEDIDO);

alter table PEDIDO_COMPRA
add constraint REL_PEDIDO_COMPRA foreign key (CNPJ_FORNECEDOR)
references FORNECEDOR (CNPJ_FORNECEDOR);

create table DISCIPLINA
(
	CO_DISCIPLINA char(2) not null,
    NO_DISCIPLINA varchar(30) null
);

alter table DISCIPLINA 
add constraint REL_DISCIPLINA primary key (CO_DISCIPLINA);

create table FREQUENCIA 
(
	CO_ALUNO int not null,
    CO_TURMA char(11) not null,
    CO_DISCIPLINA char(2) not null,
    DT_FREQUENCIA datetime not null,
    FREQUENCIA char(1) null
);

alter table FREQUENCIA 
add constraint PK_FREQUENCIA primary key (CO_ALUNO, CO_TURMA, CO_DISCIPLINA, DT_FREQUENCIA);

alter table FREQUENCIA
add constraint FK_FREQUENCIA foreign key (CO_ALUNO)
references ALUNO(CO_ALUNO);

alter table FREQUENCIA
add constraint REL_FREQUENCIA foreign key (CO_TURMA)
references TURMA(CO_TURMA);

alter table FREQUENCIA
add constraint REL_FK_FREQUENCIA foreign key (CO_DISCIPLINA)
references DISCIPLINA(CO_DISCIPLINA);

create table PROFESSOR
(
	CO_PROFESSOR int not null,
    SG_SEXO char(1) null,
    NOME varchar(20) null,
    DT_NASCIMENTO datetime null
);

alter table PROFESSOR
add constraint PK_PROFESSOR primary key (CO_PROFESSOR);

create table PROFESSOR_TURMA_DISC
(
	CO_PROFESSOR int not null,
    CO_TURMA char(11) not null,
    CO_DISCIPLINA char(2) not null
);

alter table PROFESSOR_TURMA_DISC
add constraint PK_PROF_TURMA primary key (CO_PROFESSOR, CO_TURMA, CO_DISCIPLINA);

alter table PROFESSOR_TURMA_DISC
add constraint REL_PROFESSOR_TURMA foreign key (CO_PROFESSOR)
references PROFESSOR(CO_PROFESSOR);

alter table PROFESSOR_TURMA_DISC
add constraint REL_PROFTURMA foreign key (CO_TURMA)
references TURMA(CO_TURMA);

alter table PROFESSOR_TURMA_DISC
add constraint REL_PROFDISC foreign key (CO_DISCIPLINA)
references DISCIPLINA(CO_DISCIPLINA);

create table PROVA
(
	CO_PROVA char(3) not null,
    DS_PROVA varchar(20) null
);

alter table PROVA
add constraint PK_PROVA primary key (CO_PROVA);

create table AVALIACAO
(
	CO_ALUNO int not null,
    CO_TURMA char(11) not null,
    CO_DISCIPLINA char(2) not null,
    CO_PROVA char(3) not null,
    DT_AVALIACAO datetime null,
    NT_AVALIACAO float(53) null
);

alter table AVALIACAO
add constraint PK_AVALIACAO primary key (CO_ALUNO, CO_TURMA, CO_DISCIPLINA, CO_PROVA);

alter table AVALIACAO 
add constraint FK_AVALIACAO foreign key (CO_ALUNO)
references ALUNO(CO_ALUNO);

alter table AVALIACAO 
add constraint REL_AVALIACAO foreign key (CO_TURMA)
references TURMA(CO_TURMA);

alter table AVALIACAO 
add constraint REL_FK_AVALIACAO foreign key (CO_DISCIPLINA)
references DISCIPLINA(CO_DISCIPLINA);

alter table AVALIACAO 
add constraint FK_REL_AVALIACAO foreign key (CO_PROVA)
references PROVA(CO_PROVA);



