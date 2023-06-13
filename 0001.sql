--criar tabela
create table teste (
	idTeste int primary key,
	nome varchar (50)
);

--alterando tabela, adicionando colunas
alter table teste
add idade int, add cpf varchar (14);

--adicionando mais caracteres ao nome
alter table teste alter column nome type varchar(60);

--apagar tabela
--drop table teste;

--aparecer esqueleto da tabela
select * from teste;

--inserir dados na tabela
-- quando coloca values, inserir dados nas colunas, porém é preciso saber a sequencia das colunas
insert into teste values(1,'João', 30, '999.999.999-99');
insert into teste values(2,'Tiago', 30, '888.888.888-88');

--inserir dados nas colunas, porém indicando a sequencia das colunas
insert into teste (nome, idteste, idade, cpf)values('Maria', 3, 25, '777.777.777-77');

--colunas faltantes
insert into teste (nome, idteste)values('Jozé', 4);

--inserindo dados simultaneos
insert into teste (nome, idteste, idade, cpf)values
('Yasmin', 5, 20, '666.666.666-66'),
('Karina', 6, 31, '555.555.555-55'),
('Mirela', 7, 28, '444.444.444-44');

--criando erro
insert into teste values(999,'João', 30, '999.999.999-99');

--update do erro
update teste set nome='Pedro', idade=21, cpf='333.333.333-33'
where idteste=999;

--fazendo cagada
--update teste set nome='Pedro', idade=21, cpf='333.333.333-33'

--atualizar varias linhas
update teste set idade=idade+5