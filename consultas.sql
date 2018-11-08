
-- Selecionar todos os enderaços 

SELECT * FROM tab_endereco;

--consultar o cep referente a Rua das Holandeses

SELECT cep FROM tab_endereco WHERE logradouro = 'Rua das Holandesas';


--Consultar qual é a soma de todos os anuncios que com compras acima de 100 reais

SELECT SUM(a.valor) FROM tab_compra a where valor > 100

-- Consultar o valor da compra feita pelo cliente de nome "Pedro"


update tab_compra c set c.cliente = (select ref(cl) from  tab_pessoa_fisica cl where cl.id = 1);

SELECT a.* FROM tab_compra a where
 cliente = (SELECT REF(c) FROM TAB_PESSOA_fisica c WHERE id = 1);



-- Consultar os titulos das materias que tenham sido editadas por editores que tenham Maria no nome 
-- ou escritas por jornalista com Juliana no nome.

SELECT m.titulo FROM tab_materia m where 
m.editor = (SELECT REF(e) FROM tab_editor e WHERE e.nome like '%Maria%') OR 
m.jornalista = (SELECT REF(P) FROM tab_jornalista P WHERE p.nome like '%JULIANA%');

--Averiguar o valor da Bonificação de 12% do salario recebido para cada um dos diretos excutivos
select b.nome, b.salario, b.salario*0.12 as Bonificacao FROM tab_diretor_executivo b;

--Verificar os Departamentos com valores das suas chefias diferentes de NULL
SELECT J.chefe.nome , J.nome, J.fone FROM tab_departamento J;
SELECT J.chefe.nome , J.nome, J.fone FROM tab_departamento J WHERE J.chefe IS NOT NULL;

--Consulta departamento com referencias validas e não validas
-- deve retornar 0 linhas pois 
SELECT D.chefe.cpf, D.chefe.nome, D.nome FROM tab_departamento D where D.chefe is DANGLING;
-- deve retornar todos os departamentos
SELECT  D.chefe.nome, D.nome FROM tab_departamento D where D.chefe is not DANGLING;

--Remover diretor executivo Lizieux Lindóia
SELECT D.id, D.nome, D.cpf FROM tab_diretor_executivo D;
DELETE FROM tab_diretor_executivo WHERE cpf = '0038478865';



-- consulta em varray
-- não vai rodar no live
SELECT * FROM TABLE(SELECT d.cadernos c FROM tab_edicao d WHERE d.cod = 1);


-- selecionando os 
-- não vai rodar no live
select value(t) from tab_diretor_executivo t  WHERE t.id = 1;


-- selecionando os jornalistas que são supervisionados pelo diretor executivo com o ID 1
-- professor, para executar esta consulta, caso a trigger que altera os supervisores dos jornalistas tenha sido executada
-- alterar o d.id do diretor executivo para o resultado da consuta a seguir
select t.supervisor.id from tab_jornalista t;
-- com a carga inicial o id do supervisor vai ser igual a 1, apos a executar a trigger o id vai ser 500
SELECT j.nome FROM tab_jornalista j WHERE supervisor = (SELECT REF(d) FROM tab_diretor_executivo d WHERE d.id = 500);



-- consulta que retorna a quantidade de matérias por caderno temático
select  CARDINALITY(t.materias) AS n_materias from tab_caderno_tematico t;


-- buscando o maior salário 
-- fazendo uso de diversas funções diferentes
-- estas duas próximas consulta poderia ser feita de maneira mais simples
-- esta aplicação é puramente didática 

SELECT DISTINCT FIRST_VALUE(t.salario)
 OVER (ORDER BY t.salario DESC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       AS "Maior_salario"
FROM tab_diretor_executivo t;


SELECT DISTINCT FIRST_VALUE(t.salario)
 OVER (ORDER BY t.salario ASC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       AS "Menor_salario"
FROM tab_diretor_executivo t;

-- lista o valor, a quantidade de cadernos temáticos e o nome do reponsável pela edição
select t.valor, CARDINALITY(t.anuncios) AS cadernos, t.responsavel.nome from tab_edicao t;

-- busca em atributo objeto aninhado em outro objeto
select t.manchete, t.qualificador.editor.nome editor_responsavel from tab_materia t


-- busca os países e as cidades que um determinado revendedor atua
-- exemplo de busca aninhada dentro de busca aninhada
select r.razao_social AS revendedor, nt_p.nome AS pais , nt_loc.cidade AS cidade  from tab_revendedor r, table(r.paises) nt_p, table(nt_p.localizacoes) nt_loc where r.id = 5 ;


-- BUSCA EM TABELA ANINHADA SIMPLES
select t.descricao, nt_m.manchete from tab_caderno_tematico t, table(t.materias) nt_m


-- atualizando tabela aninhada
update tab_caderno_tematico t set t.materias = NULL where t.descricao = 'policial';
update tab_caderno_tematico t set 
t.materias =  tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'ex Governador de Goiás é preso', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'Michael temer é preso', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'Bolsonaro é preso', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                        )

where t.descricao = 'policial';


-- UPDATE VARRAY
-- EXECUTE A CONSULTA PARA VER OS DADOS ORIGINAIS
SELECT e.descricao||' <'||e.tema||'>' as "CADERNOS DE UMA EDIÇÃO" FROM tab_edicao w, TABLE(w.cadernos) e WHERE w.cod = 1;

-- EXECUTE O BLOCO QUE REALIZA A ALTERAÇÃO
declare
  l_object_list tp_cadernos;
  cursor c is
    select t.cod, t.cadernos from tab_edicao t where cod = 1
    for update of t.cadernos;
begin
  for r in c loop
    l_object_list := r.cadernos;
    for i in 1..l_object_list.count loop
        l_object_list(i).descricao := 'ALTERADO';
        l_object_list(i).tema := 'ALTERADO';
    end loop;

    update  tab_edicao t
    set  t.cadernos = l_object_list
    where current of c;
  end loop;
end;

-- EXECUTE NOVAMENTE A CONSULTA PARA VER OS DADOS MODIFICADOS
SELECT e.descricao||' <'||e.tema||'>' as "CADERNOS DE UMA EDIÇÃO" FROM tab_edicao w, TABLE(w.cadernos) e WHERE w.cod = 1;

-- DEREF
select  DEREF(t.supervisor) from tab_jornalista t

-- update NT 
update table( select t.materias from  tab_caderno_tematico t where t.descricao = 'esportes' ) c set c.titulo = 'time grande sem mundial' where c.cod = 8;





-- extend em um VARRAY
DECLARE
  n tab_edicao.cadernos%type;
  i integer;
BEGIN
  select d.cadernos into n from tab_edicao d where d.cod = 1;
  n.EXTEND;
  i := n.count;
  n(i) := tp_caderno_tematico('add new caderno', 'new', NULL,NULL,NULL,  NULL, NULL);
 update tab_edicao d set d.cadernos = n where d.cod = 1;
END;

-- usando trim
select trim(t.nome) from tab_diretor_executivo t;


-- Remover um determinado departamento de uma tabela

DELETE FROM tab_departamento where cod='1';

-- Remover tabela tab_departamento

DROP TABLE tab_departamento;

-- Remover tipo tp_departamento

DROP TYPE tp_departamento force;

