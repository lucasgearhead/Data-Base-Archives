CREATE DOMAIN public.boolea AS character(1)
	CONSTRAINT boolea_check CHECK ((VALUE = ANY (ARRAY['S'::bpchar, 'N'::bpchar])));


ALTER DOMAIN public.boolea OWNER TO postgres;

--
-- TOC entry 848 (class 1247 OID 24615)
-- Name: dm_desc20; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.dm_desc20 AS character varying(20);


ALTER DOMAIN public.dm_desc20 OWNER TO postgres;

--
-- TOC entry 855 (class 1247 OID 24639)
-- Name: dm_desc50; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.dm_desc50 AS character varying(50);


ALTER DOMAIN public.dm_desc50 OWNER TO postgres;

--
-- TOC entry 845 (class 1247 OID 16414)
-- Name: dm_nomeclatura; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.dm_nomeclatura AS character varying(50);


ALTER DOMAIN public.dm_nomeclatura OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 24676)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    nome_departamento public.dm_desc50 NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24705)
-- Name: dependentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependentes (
    cpf_pessoa character varying(14) NOT NULL,
    id_funcionario integer,
    dependente_relacao public.dm_desc20
);


ALTER TABLE public.dependentes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24789)
-- Name: faxineiro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faxineiro (
    id_faxineiro integer NOT NULL,
    cargo_faxineiro public.dm_desc50 NOT NULL,
    jornada_trabalho_limpeza integer NOT NULL,
    chefia integer
);


ALTER TABLE public.faxineiro OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24695)
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionarios (
    id_funcionario integer NOT NULL,
    salario_funcionario numeric(10,2),
    id_departamento integer,
    cpf_funcionario character varying(14)
);


ALTER TABLE public.funcionarios OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24757)
-- Name: pesquisador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pesquisador (
    id_pesquisador integer NOT NULL,
    area_pesquisador public.dm_desc50 NOT NULL
);


ALTER TABLE public.pesquisador OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24652)
-- Name: pessoas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoas (
    sexo_pessoa character(1),
    cpf_pessoa character varying(14) NOT NULL,
    nome_pessoa public.dm_desc50,
    dia_nascimento integer,
    mes_nascimento integer,
    ano_nascimento integer,
    rua_pessoa public.dm_desc50,
    numero_casapessoa integer,
    bairro_pessoa character varying(30),
    cep_pessoa character varying(11),
    CONSTRAINT pessoas_ano_nascimento_check CHECK (((ano_nascimento >= 1918) AND (ano_nascimento <= 2023))),
    CONSTRAINT pessoas_cpf_pessoa_check CHECK ((length((cpf_pessoa)::text) = 14)),
    CONSTRAINT pessoas_dia_nascimento_check CHECK (((dia_nascimento >= 1) AND (dia_nascimento <= 31))),
    CONSTRAINT pessoas_mes_nascimento_check CHECK (((mes_nascimento >= 1) AND (mes_nascimento <= 12))),
    CONSTRAINT pessoas_sexo_pessoa_check CHECK ((sexo_pessoa = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);


ALTER TABLE public.pessoas OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24683)
-- Name: projetos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projetos (
    nome_projeto public.dm_desc20,
    id_projeto integer NOT NULL,
    id_departamento integer,
    periodo_projeto integer
);


ALTER TABLE public.projetos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24733)
-- Name: secretario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secretario (
    grau_escolaridade public.dm_desc50 NOT NULL,
    id_secretario integer
);


ALTER TABLE public.secretario OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24776)
-- Name: trabalhar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabalhar (
    horas_funcionario integer NOT NULL,
    id_pesquisadort integer,
    id_projetot integer
);


ALTER TABLE public.trabalhar OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 24676)
-- Dependencies: 215
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos (nome_departamento, id_departamento) VALUES ('Controle de Qualidade', 1);
INSERT INTO public.departamentos (nome_departamento, id_departamento) VALUES ('Tecnologia e Sistematização', 2);


--
-- TOC entry 3394 (class 0 OID 24705)
-- Dependencies: 218
-- Data for Name: dependentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dependentes (cpf_pessoa, id_funcionario, dependente_relacao) VALUES ('239.993.241-00', 10, 'Filho');


--
-- TOC entry 3398 (class 0 OID 24789)
-- Dependencies: 222
-- Data for Name: faxineiro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3393 (class 0 OID 24695)
-- Dependencies: 217
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionarios (id_funcionario, salario_funcionario, id_departamento, cpf_funcionario) VALUES (10, 9000.00, 1, '239.993.241-00');
INSERT INTO public.funcionarios (id_funcionario, salario_funcionario, id_departamento, cpf_funcionario) VALUES (11, 2999.00, 1, '321.321.213-10');
INSERT INTO public.funcionarios (id_funcionario, salario_funcionario, id_departamento, cpf_funcionario) VALUES (12, 4000.25, 2, '321.321.213-00');


--
-- TOC entry 3396 (class 0 OID 24757)
-- Dependencies: 220
-- Data for Name: pesquisador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pesquisador (id_pesquisador, area_pesquisador) VALUES (12, 'Desenvolvedor');


--
-- TOC entry 3390 (class 0 OID 24652)
-- Dependencies: 214
-- Data for Name: pessoas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoas (sexo_pessoa, cpf_pessoa, nome_pessoa, dia_nascimento, mes_nascimento, ano_nascimento, rua_pessoa, numero_casapessoa, bairro_pessoa, cep_pessoa) VALUES ('M', '239.993.241-00', 'Guilherme Martins', 11, 2, 2004, 'Rua Euclides da Cunha', 203, 'Jardim Europa', '180.461-55');
INSERT INTO public.pessoas (sexo_pessoa, cpf_pessoa, nome_pessoa, dia_nascimento, mes_nascimento, ano_nascimento, rua_pessoa, numero_casapessoa, bairro_pessoa, cep_pessoa) VALUES ('F', '321.321.213-10', 'Ana Ana', 2, 3, 2009, 'Rua Marechal Teodoro', 21, 'JD Santo Augusto', '322.321-22');
INSERT INTO public.pessoas (sexo_pessoa, cpf_pessoa, nome_pessoa, dia_nascimento, mes_nascimento, ano_nascimento, rua_pessoa, numero_casapessoa, bairro_pessoa, cep_pessoa) VALUES ('M', '321.321.213-00', 'Lucas Teodoro', 2, 3, 2009, 'Rua Marechal Teodoro', 21, 'JD Santo Augusto', '321.321-22');


--
-- TOC entry 3392 (class 0 OID 24683)
-- Dependencies: 216
-- Data for Name: projetos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3395 (class 0 OID 24733)
-- Dependencies: 219
-- Data for Name: secretario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.secretario (grau_escolaridade, id_secretario) VALUES ('Ensino Médio completo', 10);
INSERT INTO public.secretario (grau_escolaridade, id_secretario) VALUES ('Graduado em Administração', 11);


--
-- TOC entry 3397 (class 0 OID 24776)
-- Dependencies: 221
-- Data for Name: trabalhar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3232 (class 2606 OID 24711)
-- Name: dependentes id_dependentes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependentes
    ADD CONSTRAINT id_dependentes PRIMARY KEY (cpf_pessoa) INCLUDE (id_funcionario);


--
-- TOC entry 3234 (class 2606 OID 24763)
-- Name: pesquisador id_pesquisador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesquisador
    ADD CONSTRAINT id_pesquisador PRIMARY KEY (id_pesquisador);


--
-- TOC entry 3223 (class 2606 OID 24664)
-- Name: pessoas pk_cpfpessoa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoas
    ADD CONSTRAINT pk_cpfpessoa PRIMARY KEY (cpf_pessoa);


--
-- TOC entry 3236 (class 2606 OID 24795)
-- Name: faxineiro pk_id_faxineiro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faxineiro
    ADD CONSTRAINT pk_id_faxineiro PRIMARY KEY (id_faxineiro) INCLUDE (id_faxineiro);


--
-- TOC entry 3230 (class 2606 OID 24699)
-- Name: funcionarios pk_id_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT pk_id_funcionario PRIMARY KEY (id_funcionario);


--
-- TOC entry 3225 (class 2606 OID 24682)
-- Name: departamentos pk_iddepartamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT pk_iddepartamento PRIMARY KEY (id_departamento);


--
-- TOC entry 3227 (class 2606 OID 24689)
-- Name: projetos pk_idprojeto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT pk_idprojeto PRIMARY KEY (id_projeto);


--
-- TOC entry 3228 (class 1259 OID 24727)
-- Name: fki_fk_cpf_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_cpf_funcionario ON public.funcionarios USING btree (cpf_funcionario);


--
-- TOC entry 3240 (class 2606 OID 24717)
-- Name: dependentes cpf_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependentes
    ADD CONSTRAINT cpf_pessoa FOREIGN KEY (cpf_pessoa) REFERENCES public.pessoas(cpf_pessoa);


--
-- TOC entry 3238 (class 2606 OID 24728)
-- Name: funcionarios fk_cpf_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT fk_cpf_funcionario FOREIGN KEY (cpf_funcionario) REFERENCES public.pessoas(cpf_pessoa);


--
-- TOC entry 3246 (class 2606 OID 24801)
-- Name: faxineiro fk_id_chefia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faxineiro
    ADD CONSTRAINT fk_id_chefia FOREIGN KEY (chefia) REFERENCES public.funcionarios(id_funcionario);


--
-- TOC entry 3237 (class 2606 OID 24690)
-- Name: projetos fk_id_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT fk_id_departamento FOREIGN KEY (id_departamento) REFERENCES public.departamentos(id_departamento);


--
-- TOC entry 3239 (class 2606 OID 24700)
-- Name: funcionarios fk_id_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT fk_id_departamento FOREIGN KEY (id_departamento) REFERENCES public.departamentos(id_departamento);


--
-- TOC entry 3247 (class 2606 OID 24796)
-- Name: faxineiro fk_id_faxineiro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faxineiro
    ADD CONSTRAINT fk_id_faxineiro FOREIGN KEY (id_faxineiro) REFERENCES public.funcionarios(id_funcionario);


--
-- TOC entry 3242 (class 2606 OID 24736)
-- Name: secretario fk_id_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secretario
    ADD CONSTRAINT fk_id_funcionario FOREIGN KEY (id_secretario) REFERENCES public.funcionarios(id_funcionario);


--
-- TOC entry 3243 (class 2606 OID 24764)
-- Name: pesquisador fk_id_pesquisador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesquisador
    ADD CONSTRAINT fk_id_pesquisador FOREIGN KEY (id_pesquisador) REFERENCES public.funcionarios(id_funcionario);


--
-- TOC entry 3244 (class 2606 OID 24784)
-- Name: trabalhar fk_id_pesquisador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabalhar
    ADD CONSTRAINT fk_id_pesquisador FOREIGN KEY (id_pesquisadort) REFERENCES public.pesquisador(id_pesquisador);


--
-- TOC entry 3245 (class 2606 OID 24779)
-- Name: trabalhar fk_id_projeto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabalhar
    ADD CONSTRAINT fk_id_projeto FOREIGN KEY (id_projetot) REFERENCES public.projetos(id_projeto);


--
-- TOC entry 3241 (class 2606 OID 24712)
-- Name: dependentes id_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependentes
    ADD CONSTRAINT id_funcionario FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario);


-- Completed on 2023-05-01 23:17:02

--
-- PostgreSQL database dump complete
--

alter table pessoas alter column nome_pessoa type varchar (100);
alter table pessoas alter column cpf_pessoa type varchar (15);
alter table faxineiro rename to faxineiros;
alter table secretario rename to secretarios;
alter table pesquisador rename to pesquisadores;
alter table secretarios rename column grau_escolaridade to grau_escolaridade_secretario;
alter table funcionarios add column quantidade_dependentes integer;
select * from departamentos;
select * from dependentes;
select * from faxineiroS;
select * from funcionarios ORDER BY id_funcionario;
select * from pesquisadores;
select * from pessoas;
select *from projetos;
select * from trabalhar;
select * from FAXINEIROS;
select * from secretarios;
SELECT CPF_PESSOA FROM PESSOAS;
insert into pessoas VALUES('M','166.364.411-52','FEG',01,3,2000,'TUDE',31,'JAR','213914');
insert into pessoas VALUES('M','166.364.411-53','João Tavares',01,3,1999,'Almir Musa Soares',31,'JAR','2139144');
insert into projetos values
('Catraca inteligente',1,2,5),
('Universidade Inteligente',2,3,24);
insert  into dependentes ()
update funcionarios
set quantidade_dependentes=0
where id_funcionario=12;
alter table projetos alter column nome_projeto type varchar(100);
alter table projetos rename column periodo_projeto to periodo_projeto_meses;
insert into pesquisadores values(13,'Modificações robóticas');
insert into trabalhar values (12,13,1);
insert into trabalhar values(13,13,2);
insert into trabalhar values(1,12,2);
INSERT INTO funcionarios VALUES (15,20000.00,2,'166.364.411-53',0);


SELECT * FROM funcionarios f
    LEFT OUTER JOIN faxineiros fa ON f.id_funcionario = fa.id_faxineiro
	LEFT OUTER JOIN pesquisadores p ON f.id_funcionario = p.id_pesquisador
ORDER BY f.id_funcionario;

UPDATE dependentes
SET cpf_pessoa = '479.336.838-78'
WHERE id_funcionario=10;
select * from pesquisadores ;

UPDATE pesquisadores
SET id_pesquisador = 15
WHERE area_pesquisador='Modificações robóticas';


SELECT p.nome_pessoa, p.cpf_pessoa, p.sexo_pessoa, f.id_funcionario , f.cpf_funcionario
FROM pessoas p 
INNER JOIN funcionarios f 
ON p.cpf_pessoa = f.cpf_funcionario;

SELECT d.nome_departamento, f.id_funcionario , f.cpf_funcionario
FROM departamentos d  
INNER JOIN funcionarios f 
ON d.id_departamento = f.id_departamento;

SELECT d.cpf_pessoa,d.dependente_relacao, f.id_funcionario , f.cpf_funcionario
FROM dependentes d  
INNER JOIN funcionarios f 
ON d.id_funcionario = f.id_funcionario;

SELECT s.grau_escolaridade_secretario, f.id_funcionario , f.cpf_funcionario,pe.nome_pessoa
FROM secretarios s 
INNER JOIN funcionarios f 
ON s.id_secretario = f.id_funcionario
INNER JOIN pessoas pe ON f.cpf_funcionario = pe.cpf_pessoa;

SELECT fa.jornada_trabalho_limpeza,fa.chefia,fa.cargo_faxineiro, f.id_funcionario , f.cpf_funcionario,pe.nome_pessoa
FROM faxineiros fa
INNER JOIN funcionarios f 
ON fa.id_faxineiro = f.id_funcionario
INNER JOIN pessoas pe ON f.cpf_funcionario = pe.cpf_pessoa;

SELECT p.area_pesquisador, f.id_funcionario, f.cpf_funcionario, pe.nome_pessoa
FROM pesquisadores p
INNER JOIN funcionarios f ON p.id_pesquisador = f.id_funcionario
INNER JOIN pessoas pe ON f.cpf_funcionario = pe.cpf_pessoa;

SELECT * FROM pesquisador;

SELECT p.area_pesquisador, f.id_funcionario, f.cpf_funcionario, pe.nome_pessoa
FROM pesquisadores p
INNER JOIN funcionarios f ON p.id_pesquisador = f.id_funcionario
INNER JOIN pessoas pe ON f.cpf_funcionario = pe.cpf_pessoa;

SELECT pe.nome_pessoa, p.id_pesquisador,fa.id_faxineiro, s.id_secretario, d.cpf_pessoa
FROM pessoas pe
inner JOIN funcionarios f ON f.cpf_funcionario = pe.cpf_pessoa
inner JOIN faxineiros fa ON fa.id_faxineiro = f.id_funcionario
inner JOIN secretarios s ON s.id_secretario = f.id_funcionario
inner join pesquisadores p on p.id_pesquisador= f.id_funcionario
inner JOIN dependentes d ON d.cpf_pessoa = pe.cpf_pessoa
where f.id_funcionario=12;

select * from funcionarios

SELECT p.nome_pessoa, p.cpf_pessoa, p.sexo_pessoa, f.id_funcionario , f.cpf_funcionario
FROM pessoas p 
INNER JOIN funcionarios f 
ON p.cpf_pessoa = f.cpf_funcionario
INNER

select * from pessoas;

SELECT pe.nome_pessoa, pq.id_pesquisador,fa.id_faxineiro, s.id_secretario, d.cpf_pessoa
FROM pessoas pe
INNER JOIN funcionarios f on f.cpf_funcionario=pe.cpf_pessoa
INNER JOIN dependentes d ON d.id_funcionario=f.id_funcionario
INNER JOIN pesquisadores pq on pq.id_pesquisador=f.id_funcionario
INNER JOIN secretarios s on s.id_secretario=f.id_funcionario
INNER JOIN faxineiros fa on fa.id_faxineiro=f.id_funcionario
WHERE nome_pessoa = 'Guilherme Martins';
select* from dependentes

SELECT pe.nome_pessoa, pq.id_pesquisador, fa.id_faxineiro, s.id_secretario --,d.cpf_pessoa
FROM pessoas pe
INNER JOIN funcionarios f on f.cpf_funcionario=pe.cpf_pessoa
--INNER JOIN dependentes d ON d.cpf_pessoa=pe.cpf_pessoa
LEFT JOIN pesquisadores pq on pq.id_pesquisador=f.id_funcionario
LEFT JOIN secretarios s on s.id_secretario=f.id_funcionario
LEFT JOIN faxineiros fa on fa.id_faxineiro=f.id_funcionario
WHERE pe.nome_pessoa = 'Ana Ana';

SELECT pe.nome_pessoa, pq.id_pesquisador, fa.id_faxineiro, s.id_secretario ,d.cpf_pessoa
FROM pessoas pe
INNER JOIN funcionarios f on f.cpf_funcionario=pe.cpf_pessoa
INNER JOIN dependentes d ON d.id_funcionario=f.id_funcionario
LEFT JOIN pesquisadores pq on pq.id_pesquisador=f.id_funcionario
LEFT JOIN secretarios s on s.id_secretario=f.id_funcionario
LEFT JOIN faxineiros fa on fa.id_faxineiro=f.id_funcionario
WHERE pe.nome_pessoa = 'Guilherme Martins';


select * from FUNCIONARIOS
select * from SECRETARIOS
SELECT pg_typeof(nome_pessoa), *
FROM pessoas
WHERE nome_pessoa = 'Guilherme Martins';