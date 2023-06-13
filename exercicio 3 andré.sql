CREATE DOMAIN dm_desc20 VARCHAR(20);
CREATE DOMAIN dm_desc50 VARCHAR(50);
CREATE DOMAIN boolea AS CHAR(1) CHECK (VALUE IN ('S', 'N'));

CREATE TABLE departamentos(
	nome_departamento dm_desc20,
	id_departamento int CONSTRAINT pk_idDep PRIMARY KEY  DELETE RESTRICT
);

CREATE TABLE projetos(
	nome_projeto dm_desc20,
	id_projeto int CONSTRAINT pk_idPro PRIMARY KEY ,
	id_departamento int CONSTRAINT fk_fornecedor REFERENCES departamentos(id_departamento),
	periodo_projeto int
);
ALTER TABLE projetos RENAME COLUMN id_departamento to id_depart
SELECT * FROM projetos;
ALTER TABLE projetos ADD CONSTRAINT fk_fornecedor;
ALTER TABLE projetos ADD CONSTRAINT fk_id_departamento FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);

CREATE TABLE pessoas(
	sexo_pessoa CHAR(1) CHECK(sexo_pessoa IN ('M' ,'F')),
	cpf_pessoa VARCHAR(14) CHECK (LENGTH(cpf_pessoa) = 14) CONSTRAINT pk_cpfPessoa PRIMARY KEY,	
	nome_pessoa dm_desc50,
	dia_nascimento integer CHECK (dia_nascimento >= 1 AND dia_nascimento <= 31),
	mes_nascimento int CHECK(mes_nascimento>=1 AND mes_nascimento<=12),
	ano_nascimento int CHECK (ano_nascimento>=1918 AND ano_nascimento<=2023),
	rua_pessoa dm_desc50,
	numero_casaPessoa INT ,
	cep_pessoa	VARCHAR(8) CHECK (LENGTH(cep_pessoa) = 8),
	bairro_pessoa dm_desc20					  
);
CREATE TABLE dependentes (
	cpf_pessoa VARCHAR(14) CONSTRAINT fk_cpf_pessoa   REFERENCES pessoas(cpf_pessoa),
	dependente_bool boolea,
	dependente_relacao VARCHAR(20) CHECK (dependente_relacao IN ('SOBRINHO', 'SOBRINHA', 'NETO', 'NETA', 'FILHO', 'FILHA', 'PRIMO', 'PRIMA'))
);
drop table dependentes;