create table pessoas(
	sexo_pessoa varchar(1),
	cpf_pessoa varchar(14) primary key not null unique,
	nome_pessoa varchar(100) not null,
	dia_nascimento int,
	mes_nascimento int,
	ano_nascimento int,
	rua_pessoa varchar(50),
	numero_casapessoa int,
	bairro_pessoa varchar(30),
	cep_pessoa varchar (11)
);

create table departamentos(
	nome_departamento varchar(50) not null,
	id_departamento int primary key unique not null
);

create table funcionarios(
	id_funcionario int primary key unique,
	salario_funcionario numeric(20),
	id_departamento int references departamentos,
	cpf_funcionario varchar(14) references pessoas
);

create table dependentes(
	cpf_pessoa varchar(14) primary key references pessoas,
	id_funcionario int references funcionarios,
	dependente_relação varchar(20)
);

create table projetos(
	nome_projeto varchar(20) not null,
	id_projeto int not null unique primary key,
	id_departamento int references departamentos,
	periodo_projeto int
);

create table pesquisador(
	id_pesquisador int primary key not null references funcionarios,
	area_pesquisador varchar(50)
);

create table trabalhar(
	horas_funcionario int,
	id_pesquisadort int references pesquisador,
	id_projetot int references projetos
);

create table secretario(
	grau_escolaridade varchar(50),
	id_secretario int references funcionarios
);

create table faxineiro(
	id_faxineiro int primary key not null references funcionarios,
	cargo_faxineiro varchar(50),
	jornada_trabalho_limpeza int,
	id_chefia int not null references funcionarios
);