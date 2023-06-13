--criar entidade departamentos
create table departamentos(
	idDepartamentos int primary key,
	siglaDepartamento varchar(3) not null,
	nomeDepartamento varchar(30) not null
);

--alterar varchar da coluna nome
alter table cursos alter column nome_curso type varchar(50);

select * from departamentos;

--alterando o nome das colunas
alter table departamentos rename column nomedepartamento to nome_departamento;

--criando entidade curso
create table cursos (
	id_curso int primary key,
	id_departamento int references departamentos,
	sigla_curso varchar(3) not null,
	nome_curso varchar(30) not null	
);

select * from cursos;

create table disciplinas(
	id_disciplinas int primary key,
	id_curso int references cursos,
	sigla_disciplinas varchar(4) not null,
	nome_disciplinas varchar(50),
	optativa boolean default false
);

select * from disciplinas;

--criando entidade alunos
create table alunos(
	ra int primary key,
	cpf varchar(14) not null unique,
	nome_aluno varchar(50) not null,
	data_nascimento date check(age(current_date, data_nascimento)>='14 years')
);

alter table alunos add column status boolean default true;

select * from alunos;

--criando entidade disciplinas_alunos

create table disciplinas_alunos(
	id_disciplina_aluno int primary key,
	id_disciplina int references disciplinas, 
	ra int references alunos,
	data_matricula date
);

--visualizar
select * from disciplinas_alunos;

--alterar tamanho do nome das colunas do departamento
alter table departamentos alter column nome_departamento type varchar(50);

--povoando a entidade departamentos	
insert into departamentos values (1,'CST','Curso Superior em Tecnologia');
insert into departamentos values (2,'CT','Curso Técnico');
insert into departamentos values 
(3,'CAI','Curso de Aprendizagem Industrial'),
(4,'FIC','Formação Iniciada e Continuada');

--alterando o nome do conteúdo
update departamentos set nome_departamento = 'Formação Inicial e Continuada'
where id_departamento = 4;

--ordenar tabela decrescente
select * from departamentos
order by id_departamento desc;

--ordenar tabela crescente
select * from departamentos
order by id_departamento;

--ordenar tabela alfabetica
select * from departamentos
order by sigla_departamento;

--fazer contagens de todas as linhas
select count(*) from departamentos;

--fazer contagem de todas as linhas que nao possuem null
select count('any') from departamentos;

insert into cursos values 
(1,1,'ADS','TECNÓLOGO EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS'),
(2,1,'MEC','TECNÓLOGO EM MECATRÔNICA'),
(3,2,'DEV','TECNÓLOGO EM DESENVOLVIMENTO DE SISTEMAS'),
(4,2,'MEC','TECNÓLOGO EM MECATRÔNICA'),
(5,3,'EME','ELETRICISTA DE MANUTENÇÃO ELETROELETRÔNICO'),
(6,3,'MUS','MECÂNICO DE USINAGEM'),
(7,3,'ADM','ADIMINISTRAÇÃO'),
(8,4,'CLP','CONTROLADORES LÓGICOS PROGRAMÁVEIS'),
(9,4,'EXC','EXCEL'),
(10,4,'PBI','POWER BI'),
(11,4,'ROB','ROBÓTICA INDUSTRIAL'),
(12,4,'EIN','ELETRICISTA INSTALADOR'),
(13,4,'HDR','HIDRÁULICA'),
(14,4,'PNE','PNEUMÁTICA'),
(15,4,'FER','FERRAMENTEIRO');

--mostrar tabelas especificas
select sigla_curso, nome_curso from cursos;

--mostrar quantos cursos tem
select count(*) from cursos;

--mostrar tabela departamentos
select * from departamentos;

--MOSTRAR TABELA CURSOS
select * from cursos;