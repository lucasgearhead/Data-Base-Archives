--criar tabela departamentos
create table DEPARTAMENTOS(
	nome_departamento varchar (50),
	id_departamento int primary key
);

--criar tabela projetos
create table PROJETOS(
	nome_projeto varchar(50),
	id_projeto int primary key,
	periodo_projeto int
);

--criar tabela funcionarios
create table funcionarios(
nome_funcionario varchar(50),
	rua_funcionario varchar(30),
	numero_casa_funcionario int,
	cep_funcionario varchar(10),
	bairro_funcionario varchar(30),
	sexo_funcionario varchar (10),
	dia_nascimento_funcionario int,
	mes_nascimento_funcionario int,
	ano_nascimento_funcionario int,
	salario_funcionario money,
	id_funcionario int primary key,
	cpf_funcionario varchar (14)
);

--criar tabela secretario
create table secretario(
	grau_escolaridade_secretario varchar (70),
	id_secretario int primary key
);

--criar tabela pesquisador
create table pesquisador(
	area_pesquisador varchar(50),
	id_pesquisador int primary key
);

--criar tabela faxineiro
create table faxineiro(
	cargo_limpeza varchar(50),
	jornada_trabalho_limpeza varchar(50),
	id_faxineiro int primary key
);

--criar tabela dependentes
create table dependentes(
	id_dependente int primary key,
	nome_dependente varchar (50),
	sexo_dependente varchar(50),
	dia_nascimento_dependente int,
	mes_nascimento_dependente int,
	ano_nascimento_dependente int,
	parentesco_dependente varchar (50)
);