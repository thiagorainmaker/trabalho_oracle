-- Consulta método - objetos

select p.salarioAnual( ) from tab_diretor_executivo p;
select p.salarioAnual( ) from tab_jornalista p;
select p.salarioAnual( ) from tab_editor p;

/

-- Consulta método ORDER 
-- Comparar os salários dos empregados cujos CPF são 2313421 e 23423234

DECLARE
  mb tp_jornalista;
  m number;
BEGIN
  SELECT VALUE(p) INTO mb FROM tab_jornalista p
WHERE p.cpf = '2313421';
  SELECT d.comparasalario(mb) into m FROM tab_jornalista d WHERE
  d.cpf = '23423234';
  IF m > 0 THEN 
    DBMS_OUTPUT.PUT_LINE('FUNCIONÁRIO DE CPF: '||'23423234' || ' TEM SALARIO MAIOR QUE O DO FUNCIONÁRIO DE CPF: '||TO_CHAR(mb.cpf) ); 
  END IF;
  IF m = 0 THEN 
    DBMS_OUTPUT.PUT_LINE('FUNCIONÁRIO DE CPF: '||'23423234' || ' TEM SALARIO IGUAL AO DO FUNCIONÁRIO DE CPF: '||TO_CHAR(mb.cpf) ); 
  END IF;
  IF  m < 0 THEN 
    DBMS_OUTPUT.PUT_LINE('FUNCIONÁRIO DE CPF: '||'23423234' || ' TEM SALARIO MENOR QUE O DO FUNCIONÁRIO DE CPF: '||TO_CHAR(mb.cpf) );
  END IF;
END;

-- Consulta método ORDER 
-- Comparar os salários dos empregados cujos CPF são 1231233453 e 12312312

DECLARE
  mb tp_diagramador;
  m number;
BEGIN
  SELECT VALUE(p) INTO mb FROM tab_diagramador p WHERE p.cpf = '1231233453';
  SELECT d.comparasalario(mb) into m FROM tab_diagramador d WHERE d.cpf = '12312312';
  IF m > 0 THEN 
    DBMS_OUTPUT.PUT_LINE('FUNCIONÁRIO DE CPF: '||'12312312' || ' TEM SALARIO MAIOR QUE O DO FUNCIONÁRIO DE CPF: '||TO_CHAR(mb.cpf) ); 
  END IF;
  IF m = 0 THEN 
    DBMS_OUTPUT.PUT_LINE('FUNCIONÁRIO DE CPF: '||'12312312' || ' TEM SALARIO IGUAL AO DO FUNCIONÁRIO DE CPF: '||TO_CHAR(mb.cpf) ); 
  END IF;
  IF m < 0 THEN 
    DBMS_OUTPUT.PUT_LINE('FUNCIONÁRIO DE CPF: '||'12312312' || ' TEM SALARIO MENOR QUE O DO FUNCIONÁRIO DE CPF: '||TO_CHAR(mb.cpf) );
  END IF;
END;
-- Consulta método MAP nos objetos de Atividade – Ordenação

SELECT a.cod, a.descricao FROM tab_fotografia a ORDER BY a.fotografiaToCadeia();

-- Consulta do método de Herança de Tipos

Select p.buscar_CNPJ() from tab_revendedor p;

--Consulta método Herança de Tipos

select p.salarioAnual( ) from tab_fotografo p;


-- Consulta método Herança de Tipos

select p.salarioAnual( ) from tab_diagramador p;

/
--Implementação de métodos para consultar, quantificar e excluir elementos específicos
-- Qual o segundo anuncio da edição cod=2?


DECLARE
  n tab_edicao.anuncios%TYPE;
BEGIN
  SELECT d.anuncios into n from tab_edicao d  WHERE d.cod = 2;
  Dbms_output.put_line('Segundo Anuncio = '|| n(2).tamanho|| '-' || n(2).texto || '-' || n(2).titulo|| '-' || n(2).valor);
End;


--Acrescentar o anuncio ('10X10', 'Maquiagem para noivas', 'Maquiagem', 50.00)
--ao conjunto de anuncios da Edicao de cod=2.

-- EXIBINDO ANUNCIO ANTES DO UPDATE
SELECT a.tamanho||' <'||a.texto||'>' ||a.titulo||'>'||a.valor||'>' as "Anuncios de Edicao" FROM tab_edicao w, TABLE(w.anuncios) a WHERE w.cod = 2;

Declare
  n tab_edicao.anuncios%TYPE;
  i integer;
Begin
  Select d.anuncios into n from tab_edicao d  where d.cod = 2;
  n.extend;  
  i := n.count;
  n(i) := tp_anuncio('10X10', 'Maquiagem para noivas', 'Maquiagem', 50.00);  
  Update tab_edicao d set d.anuncios = n where d.cod = 2;
End;

-- EXIBINDO ANUNCIO APOS DO UPDATE
SELECT a.tamanho||' <'||a.texto||'>' ||a.titulo||'>'||a.valor||'>' as "Anuncios de Edicao" FROM tab_edicao w, TABLE(w.anuncios) a WHERE w.cod = 2;


-- Quantos anuncios tem a Edicao 2?


Declare 
  n tab_edicao.anuncios%type;
Begin
  Select d.anuncios into n from tab_edicao d where d.cod = 2;
  Dbms_output.put_line('Quantidade de anuncios = '|| n.count);
End;


/
-- Alterar o tamanho do terceiro anuncio da edicao cod=2 para '60X10' erro


Declare
  n tab_edicao.anuncios%type;
  i integer;
Begin
  Select d.anuncios into n from tab_edicao d where d.cod = 2;  
  n(3).tamanho := '60X10';
  Update tab_edicao d set d.anuncios = n where d.cod = 2;
End;


-- VERIFICANDO OS DADOS ATUALIZADOS
SELECT a.tamanho||' <'||a.texto||'>' ||a.titulo||'>'||a.valor||'>' as "Anuncios de Edicao" FROM tab_edicao w, TABLE(w.anuncios) a WHERE w.cod = 2;


--Alterar o titulo do anuncio 'Saúde dos Pés' para 'Saúde' erro
DECLARE 
  n tab_edicao.anuncios%type;
  i integer := 0;
Begin
  SELECT d.anuncios into n FROM tab_edicao d WHERE d.cod = 2;
  FOR m in 1..n.count loop  
    If n(m).titulo = 'Saúde dos Pés' then
      i := m;
      Exit;
    End if;   
  End loop;  
  If i <> 0 then  
    n(i).titulo := 'Saúde';
    Update tab_edicao d set d.anuncios = n where d.cod = 2;  
  End if;
End;



--Consulta

SELECT a.tamanho||' <'||a.texto||'>' ||a.titulo||'>'||a.valor||'>' as "Anuncios de Edicao"  FROM tab_edicao w, TABLE(w.anuncios) a WHERE w.cod = 2;



--Remover o terceiro anuncio da Edição cod=2 erro

Declare
  n tab_edicao.anuncios%type;
  Begin  
    Select d.anuncios into n from tab_edicao d where d.cod = 2;
    
  For i in 3.. n.count-1 loop  
    n(i) := n(i+1);
  End loop;  
  n.trim;  
  Update tab_edicao d set d.anuncios = n where d.cod = 2;
End;

--Consulta

SELECT a.tamanho||' <'||a.texto||'>' ||a.titulo||'>'||a.valor||'>' as "Anuncios de Edicao"  FROM tab_edicao w, TABLE(w.anuncios) a WHERE w.cod = 2;


-----------------------------------------------------------------------------------------------------------------


-- teste método que retorna as matérias ordenadas por data
-- usando MAP
SELECT a.manchete, a.data_escrita FROM tab_materia a ORDER BY a.lista_por_data();




-- bloco de código que compara duas edições e diz qual tem o maior valor
-- exemplo de uso de ORDER

DECLARE
    ed tp_edicao;
    n number;
BEGIN 
    SELECT VALUE(p) INTO ed FROM tab_edicao p WHERE p.cod = 1;
    SELECT d.func_order(ed) INTO n FROM tab_edicao d  WHERE d.cod = 2;
    IF n > 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Valor da edição n° 1 é maior que da edição 2 ' );
    END IF;
    IF n = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Valor da edição n° 1 é igual o da edição 2 ' );
    END IF;
    IF n < 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Valor da edição n° 1 é menor que da edição 2 ' );
    END IF;
END; 




-- teste de construtores sobrecarregados
insert into tab_localizacao values(tp_localizacao('74310270')); 
insert into tab_localizacao values(tp_localizacao('74310270', 'Goiás'));
insert into tab_localizacao values (tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''));

-- teste sobreescrita construtor
insert into tab_pessoa_fisica values(tp_pessoa_fisica(tp_cliente(500, null, null)));


