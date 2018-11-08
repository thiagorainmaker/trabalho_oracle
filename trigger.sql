-- TRIGGER que impede a edição do texto de uma matéria apos a sua aprovação
-- para testar a trigger primeiro execute o código de criação da trigger

CREATE OR REPLACE TRIGGER trg_aprovacao_materia
  BEFORE UPDATE OF texto ON TAB_MATERIA
    FOR EACH ROW
    BEGIN
        IF :NEW.data_aprovacao IS NOT NULL THEN
           Raise_application_error(-20324,'Materia já aprovada - não é possível alterar o texto' || ' Operação cancelada');
        END IF;
    END;
/

-- apos a criação da trigger, rode os inserts com dados de teste.
-- observe que o único dado relevante para o teste é a data de aprovação da matéria

-- para garantir que não ha dados com os ID's 500 e 501
delete from tab_materia t where t.cod = 500;
delete from tab_materia t where t.cod = 501;

-- inserindo dados para teste
insert into tab_materia values ( TP_MATERIA(500, null, null, null, null,
TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), null, null, null,null));
        
insert into tab_materia values ( TP_MATERIA(501, null, null, null, null,
null, null, null, null,null));
        
    
-- apos inserir os dados de teste rode os dois comandos SQL 
-- o primeiro, que altera a matéria com cod = 501 vai funcionar sem problemas
-- o segundo sera impedido de executar, pois a matéria já foi aprovada, e segundo a nossa regra 
-- o texto não deve mais ser alterado

update tab_materia m set m.texto = 'blá blá blá' where cod = 501;
update tab_materia m set m.texto = 'blá blá blá' where cod = 500;

-----------------------------------------------------------------------------------------------------------------------------------


-- trigger responsavel por manter sempre como supervisor dos jornalistas o diretor executivo com mais tempo de casa
-- para testar a triguer primeiro execute o código de criação da trigger
-- importante observar tambem que esta trede atua sempre APOS o insert, update ou Delete;

CREATE OR REPLACE TRIGGER verifica_diretor_executivo
AFTER  INSERT OR DELETE OR UPDATE ON tab_diretor_executivo
DECLARE
    v_sup TP_DIRETOR_EXECUTIVO;
BEGIN
   UPDATE tab_jornalista j SET j.supervisor = (  select REF(T) from tab_diretor_executivo t where data_admissao IN (select min(t1.data_admissao)  from tab_diretor_executivo t1  ) and ROWNUM = 1 );
END;
/
-- em seguida faça uma consulta no diretor executivo dos jornalistas
-- logo apos rodar o script de insert o diretor executivo vai ser o João das neves
select t.supervisor.nome from tab_jornalista t

-- para disparar a trigger basta fazer um insert de um diretor executivo com mais tempo de casa
-- a trigger esta preparada também para o improvável caso de que os dois diretores mais antigos 
-- foram contratados na mesma data
insert into tab_diretor_executivo values (
tp_diretor_executivo(
	500,
	5000.00, 
	'Gustavo Batista', 
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, 
	'00103841111',  
	TO_DATE('2002/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 1), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 1),
	NULL,
	NULL,
	NULL
));

-- execute novamente a consulta e observe que o supervisor dos jornalista agora é o Gustavo Batista
select t.supervisor.nome from tab_jornalista t


--------------------------------------------------------------------------------------------------------------------------------


-- trigger que impede a redução do valor de uma edição
-- para testar primeiro execute o código de criação da trigger

CREATE OR REPLACE TRIGGER trg_verifica_valor_edicao
BEFORE UPDATE  OF valor ON tab_edicao
    FOR EACH ROW
BEGIN
        IF :OLD.valor > :NEW.valor THEN
           Raise_application_error(-20325,'Não é permitido reduzir o valor da edição' || ' Operação cancelada');
        END IF;
END;
/

-- em seguida, para fins de validação, faça uma busca pelo valor atual das ediçoes
select t.valor from tab_edicao t

-- apos executar o script de insersert o valor será de 5.20 e 3.4
-- O código a seguir demonstra que caso o valor de atualização seja maior, o update funciona normalmente
update tab_edicao t set t.valor = 8.0

-- no entanto se o valor da edição for menor que o valor atual, a trigger é acionada e impede a atualização
update tab_edicao t set t.valor = 3.0

---------------------------------------------------------------------------------------------------------------------------------



-- uma das regras do nosso jornal trata sobre o salário dos fotografos
-- um fotografo deve ganhar a média salarial de um jornalista
-- para tanto foi criado uma trigger mutante no momento que um novo jornalista é cadastrado
-- recalcula o valor devido a ser pago a cada fotografo
-- para testar primeiro crie o PACKAGE com a definição da PROCEDURE

CREATE OR REPLACE PACKAGE trigger_api AS
    PROCEDURE salario_jornalista(sal IN tab_jornalista.salario%TYPE ) ;
END trigger_api;
/
-- Em seguida defina o BODY da PROCEDURE 

CREATE OR REPLACE PACKAGE BODY trigger_api AS PROCEDURE salario_jornalista(sal IN tab_jornalista.salario%TYPE  )  IS
    v_n_jornalista NUMBER(10);
    v_s_jornalista NUMBER(10);
    BEGIN
        SELECT COUNT(t.salario) INTO v_n_jornalista FROM tab_jornalista t;
        SELECT SUM(t.salario)  INTO v_s_jornalista FROM  tab_jornalista t;
        UPDATE tab_fotografo t set t.salario = ((v_s_jornalista+sal)/(v_n_jornalista+1));
    END salario_jornalista;
END trigger_api;
/
-- depois execute o código de criação da trigger associada a tab_jornalista
-- para este modelo de solução, deve se criar uma trigger específica para INSERT, UPDATE e DELETE
-- usando COMPOUND eu consegui resolver as três situações em uma única trigger

CREATE OR REPLACE TRIGGER tri_sal_jornalista  BEFORE INSERT ON tab_jornalista
    FOR EACH ROW
    BEGIN
    trigger_api.salario_jornalista(:NEW.salario);
END;
/

-- PARA TESTAR A TRIGGER BASTA EXECUTAR O BLOCO DE CÓDIGO A SEGUIR
DECLARE
    v_n_jornalista NUMBER(10);
    v_s_jornalista NUMBER(10);
    v_s_fotografo NUMBER(10);
BEGIN
    
    DELETE FROM tab_JORNALISTA T WHERE T.ID = 612;
    insert into tab_JORNALISTA values (TP_JORNALISTA(612, 1700.00,  NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL ));


    SELECT COUNT(t.salario) INTO v_n_jornalista FROM tab_jornalista t;
    SELECT SUM(t.salario)  INTO v_s_jornalista FROM  tab_jornalista t;
    select t.salario INTO v_s_fotografo from tab_fotografo t where ROWNUM = 1;
    dbms_output.put_line ('Média salarial jornalista');
    dbms_output.put_line (v_s_jornalista/v_n_jornalista);
    dbms_output.put_line ('Salário de um fotógrafo');
    dbms_output.put_line (v_s_fotografo);
END;

-- apos executar todo o processo, o salário dos fotografos deve ser igual a média do salário dos
-- jornalistas, e este valor é recalculado a cada jornalista novo criado 



--------------------------------------------------------------------------------------------------------------------------------

-- Existe uma regra de negocio semelhante a da trigger anterior que é aplicada entre editores e diagramadores
-- o salário de um diagramador é a média do salario dos editores, para tanto a trigger abaixo foi criada
-- no entanto, decidi resolver esta situação usando uma trigger COMPOUND
-- para testar primeiro execute o código de criação da trigger

CREATE OR REPLACE TRIGGER trg_salario_diagramador FOR INSERT OR UPDATE OR DELETE ON tab_editor COMPOUND TRIGGER
    
    v_n_editores NUMBER(10);
    v_s_editores NUMBER(10);
    
    BEFORE STATEMENT IS
    BEGIN
        SELECT COUNT(t.salario) INTO v_n_editores FROM tab_editor t;
        SELECT SUM(t.salario)  INTO v_s_editores FROM  tab_editor t;
    END BEFORE STATEMENT;
    AFTER EACH ROW IS
    BEGIN

	CASE

		WHEN INSERTING THEN
         		UPDATE tab_diagramador t set t.salario = ((v_s_editores+:NEW.salario)/(v_n_editores+1));
		WHEN UPDATING THEN
			UPDATE tab_diagramador t set t.salario = ((v_s_editores-:OLD.salario+:NEW.salario)/(v_n_editores));
		WHEN DELETING THEN
			UPDATE tab_diagramador t set t.salario = ((v_s_editores-:OLD.salario)/(v_n_editores-1));
	END CASE;
    END AFTER EACH ROW;
END trg_salario_diagramador;
/

-- A PROCEDURE A SEGUIR DEVE SER CRIADA PARA FACILITAR OS TESTES
-- EXECUTE O CÓDIGO DE CRIAÇÃO E EM SEQUIDA RODE O BLOCO DE CÓGIGO

CREATE OR REPLACE PROCEDURE exibe_salario 
IS
    v_n_editores NUMBER(10);
    v_s_editores NUMBER(10);
    v_s_diagramador NUMBER(10);
BEGIN
    SELECT COUNT(t.salario) INTO v_n_editores FROM tab_editor t;
    SELECT SUM(t.salario)  INTO v_s_editores FROM  tab_editor t;
    select t.salario  INTO v_s_diagramador from  tab_diagramador t where ROWNUM = 1;

    dbms_output.put_line ('média salarial dos editores');
    dbms_output.put_line (v_s_editores/v_n_editores);
    
    dbms_output.put_line ('salário de um diagramador');
    dbms_output.put_line (v_s_diagramador);
END;


-- ESTE BLOCO DE CÓDIGO VAI INSERI, ATUALIZAR E REMOVER UM EDITOR E 
-- EXIBIR AS MÉDIAS SALARIAL DOS EDITORES E O SALÁRIO DE UM DIAGRAMADOR 
-- A CADA OPERAÇÃO REALIZADA
DECLARE
BEGIN
    -- SÓ PARA GARANTIR QUE NÃO EXISTE O ID=510 NO BANCO
    delete from tab_editor where id = 510;
    
    dbms_output.put_line ('----------------------------------(INSERINDO UM EDITOR)--------------------------------');
    insert into tab_editor values (TP_editor(510, 3200.00, null, null,null, null, null, null, null, null, null));
    exibe_salario();
    dbms_output.put_line ('----------------------------------(ATUALIZANDO UM EDITOR)--------------------------------');
    update tab_editor t set t.salario = 900.00 where t.id = 510;
    exibe_salario();
    dbms_output.put_line ('----------------------------------(REMOVENDO UM EDITOR)--------------------------------');
    delete from tab_editor where id = 510;
    exibe_salario();
END;
----------------------------------------------------------------------------------------------------------------------------


-- TRIGGER QUE REMOVE TODAS AS COMPRAS DE UM CLIENTE PESSOA FÍSICA ANTES DE REMOVER O CLIENTE

-- PARA TESTAR PRIMEIRO RODE O CÓDIGO DE CRIAÇÃO DA TRIGGER
create or replace trigger delete_pessoa_fisica
    BEFORE delete ON tab_pessoa_fisica 
    for each row
declare
    pragma autonomous_transaction;
begin
    delete from tab_compra c where c.cliente = (select ref(cl) from  tab_pessoa_fisica cl where cl.id = :OLD.id );
    commit;
end delete_pessoa_fisica;


-- EM SEQUENCIA EXECUTE O CODIGO PARA UMA CARGA DE DADOS DE TESTE
insert into TAB_PESSOA_FISICA values( Tp_PESSOA_FISICA(900, NULL, NULL,NULL, NULL) );

insert into tab_compra values (
    tp_compra(
        TO_DATE('25/09/2017', 'dd/mm/yyyy'), 
        'Anuncios', 
        250.25,
        (SELECT REF(P) FROM TAB_PESSOA_FISICA P WHERE id = 900), 
        tp_nt_anuncios(
            tp_anuncio('10X10', 'Lindo apartamento mobiliado e com vista para o mar, apenas 300.000', 'Apartamento - Rua das Acaceas', 58.60),
            tp_anuncio('60X10', 'A Clinica Gisleuda conta com uma equipe tecnica capacitada e com uma infraestrutura singular', 'Gisleuda Fisioterapia', 100),
            tp_anuncio('60X70', 'Bateu o carro? Danificou a estrutura do seu veículo, na Martelinho de ouro seu carro sai como novo. Vem pra cáLigue  3344-34555', 'Martelinho de Ouro', 360),
            tp_anuncio('90X80', 'Trazemos de volta seu amor em 30 dias! Seus inimigos lhe perseguem? Persiga eles também.', 'Casa Exoterica - Mãe Lucinda', 450),
            tp_anuncio('10X20', 'Nossa baleia de estimaçãopariu um filhotinho saudavel, nossa piscina não comporta mais que três baleias, infelizmente não podemos ficar com ele. Caso haja interesse ligar para 4554-8966. Preço a Acordar.', 'Filhote de Baleia Joubat',69.30)
        )
    )
);



-- A TRIGGER É ATIVADA QUANDO SE EXCLUI UMA PESSOA FÍSICA 
DELETE FROM TAB_PESSOA_FISICA WHERE ID = 900;

-- CÓDIGO PARA VERIFICAR AS COMPRAS TESTE CLIENTE
-- ESPERA-SE RETORNO DE ZERO LINHAS
SELECT T.* FROM TAB_COMPRA T WHERE T.CLIENTE = (SELECT REF(P) FROM TAB_PESSOA_FISICA P WHERE id = 900);



