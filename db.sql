CREATE OR REPLACE TYPE tp_localizacao AS OBJECT(     
        id        NUMBER(4),     
        rua       VARCHAR2(40),     
        cep       VARCHAR2(12),     
        cidade    VARCHAR2(30),     
        estado    VARCHAR2(25) ,

        CONSTRUCTOR FUNCTION tp_localizacao (v_cep VARCHAR2, v_estado VARCHAR2) RETURN SELF AS RESULT,
        CONSTRUCTOR FUNCTION tp_localizacao (v_cep VARCHAR2) RETURN SELF AS RESULT    
);
/

CREATE OR REPLACE TYPE nt_tp_localizacao AS TABLE OF tp_localizacao;
/

CREATE OR REPLACE TYPE tp_pais AS OBJECT (     
  nome          VARCHAR2(40),     
  localizacoes  nt_tp_localizacao);
/

CREATE OR REPLACE TYPE  nt_tp_paises AS TABLE OF tp_pais; 
/

CREATE OR REPLACE TYPE tp_endereco AS OBJECT (     
	cod NUMBER(4),             
	cep		varchar2(255),     
        logradouro	varchar2(255),     
        numero		varchar2(255)     
); 
/

CREATE OR REPLACE TYPE tp_contato AS OBJECT  (     
  	cod NUMBER(4),     
        celular varchar2(255),     
        fone varchar2(255)     
); 
/

CREATE OR REPLACE TYPE tp_funcionario AS OBJECT(     
id NUMBER(4),     
	salario NUMBER(10,2),       
        nome varchar2(255),     
        data_nascimento timestamp,     
        matricula INTEGER,     
        cpf varchar2(255),     
        data_admissao timestamp,     
        contato REF tp_contato,     
        endereco REF tp_endereco,     
    
        MEMBER FUNCTION salarioAnual RETURN NUMBER,     
        ORDER MEMBER FUNCTION comparaSalario (x tp_funcionario) RETURN INTEGER  
   
) NOT FINAL; 
/

CREATE OR REPLACE TYPE tp_diretor_executivo UNDER  tp_funcionario(     
	foto blob -- campo imágem atendendo ao requisito     
); 
/

-- Herança de tipo
-- Herda os atributos de Funcionario

CREATE OR REPLACE TYPE tp_diagramador UNDER tp_funcionario 
( 
    CONSTRUCTOR FUNCTION tp_diagramador (x1 tp_funcionario)      
    RETURN SELF AS RESULT,      
    OVERRIDING MEMBER FUNCTION salarioAnual RETURN NUMBER 
);
/

CREATE OR REPLACE TYPE tp_editor UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_jornalista UNDER tp_funcionario();
/

CREATE OR REPLACE TYPE tp_fotografo UNDER tp_funcionario  
(      
    CONSTRUCTOR FUNCTION tp_fotografo (x1 tp_funcionario)      
    RETURN SELF AS RESULT,      
    OVERRIDING MEMBER FUNCTION salarioAnual RETURN NUMBER      
); 
/

ALTER TYPE tp_funcionario ADD ATTRIBUTE supervisor REF tp_diretor_executivo CASCADE;

-- Especificação da interface pública do objeto

CREATE OR REPLACE TYPE tp_departamento AS OBJECT  (       
  	    cod INTEGER,       
        nome varchar2(255),       
        fone varchar2(255),       
        chefe REF  tp_diretor_executivo,  
  
        MAP MEMBER FUNCTION departamentoTOInt RETURN INTEGER,   
        MEMBER PROCEDURE exibir_detalhes (SELF IN OUT tp_departamento)         
) NOT FINAL; 
/

ALTER TYPE tp_funcionario ADD ATTRIBUTE setor REF tp_departamento CASCADE;

CREATE OR REPLACE TYPE tp_qualificador  AS OBJECT (     
	cod NUMBER(4),     
        materia_de_capa NUMBER(1,0),     
        relevancia INTEGER,     
        data_qualificacao timestamp,     
	editor REF tp_editor     
); 
/

CREATE OR REPLACE TYPE tp_materia AS OBJECT (         
    	cod NUMBER(4),                
        lead varchar2(255),         
        manchete varchar2(255),         
        texto varchar2(255),         
        titulo varchar2(255),         
        data_aprovacao timestamp,         
	    editor REF tp_editor,         
        data_escrita timestamp,         
	    jornalista REF tp_jornalista,         
	    qualificador tp_qualificador,

        FINAL MAP MEMBER FUNCTION lista_por_data RETURN timestamp     
); 
/

CREATE OR REPLACE TYPE tp_nt_materias AS TABLE OF tp_materia; 
/

CREATE OR REPLACE TYPE tp_caderno_tematico AS OBJECT(     
	descricao varchar2(255),     
	tema varchar2(255),     
    data_diagramacao timestamp,     
	diagramador REF tp_diagramador,     
  	data_revisao timestamp,     
	editor REF tp_editor,	     
	materias tp_nt_materias     
); 
/

CREATE OR REPLACE TYPE tp_cadernos AS VARRAY(5) OF tp_caderno_tematico; 
/

CREATE OR REPLACE TYPE tp_anuncio  AS OBJECT (     
	tamanho varchar2(255),     
	texto varchar2(255),     
	titulo varchar2(255),     
	valor NUMBER(10,2)     
); 
/

CREATE OR REPLACE TYPE tp_nt_anuncios AS TABLE OF tp_anuncio; 
/

CREATE OR REPLACE TYPE tp_edicao AS OBJECT (     
        cod NUMBER(4),        
	valor NUMBER(10,2),     
	data_edicao timestamp,     
	data_aprovacao timestamp,     
	responsavel REF tp_diretor_executivo,     
	cadernos tp_cadernos,     
	anuncios tp_nt_anuncios, 

    ORDER MEMBER FUNCTION func_order(x tp_edicao) RETURN NUMBER    
);
/

-- Herança de Tipos
-- Definir o tipo p/ entid. Fotografia, MAP fotografiaToCadeia ñ deve ser redefinido por seus subtipos

CREATE OR REPLACE TYPE tp_fotografia AS object (     
        cod NUMBER(4),        
        data_foto timestamp,     
        descricao varchar2(255),     
        imagem varchar2(255),     
        local varchar2(255),     
    	fotografo REF tp_fotografo,     
        
        FINAL MAP MEMBER FUNCTION fotografiaToCadeia RETURN VARCHAR2     
) FINAL; 
/

CREATE OR REPLACE TYPE  tp_escolhe   AS OBJECT  (     
	foto REF tp_FOTOGRAFIA,     
    data timestamp,     
	materia REF tp_materia,     
    jornalista REF tp_jornalista     
); 
/

CREATE OR REPLACE TYPE  tp_cliente AS OBJECT (     
  	id  NUMBER(4),     
	contato ref tp_contato,     
	endereco ref tp_endereco     
)NOT FINAL;
/

CREATE OR REPLACE TYPE tp_pessoa_fisica  UNDER tp_cliente(     
        cpf varchar2(255),     
        nome varchar2(255),

        CONSTRUCTOR FUNCTION tp_pessoa_fisica (v_cliente tp_cliente) RETURN SELF AS RESULT     
);
/

CREATE OR REPLACE TYPE  tp_pessoa_juridica UNDER tp_cliente(     
        cnpj varchar2(255),     
        razao_social varchar2(255)     
); 
/

CREATE OR REPLACE TYPE tp_revendedor AS object (   
        id  NUMBER(4),   
    	contato ref tp_contato,   
        cnpj varchar2(255),   
        razao_social varchar2(255),   
        paises  nt_tp_paises,   
        
        FINAL MAP MEMBER FUNCTION buscar_CNPJ RETURN VARCHAR2)   
FINAL; 
/

CREATE OR REPLACE TYPE  tp_distribuida AS OBJECT (       
	data timestamp,       
	tiragem INTEGER,       
	edicao REF tp_edicao,       
	revendedor REF tp_revendedor      
       ); 
/

CREATE OR REPLACE TYPE  tp_compra AS OBJECT (     
        data timestamp,     
        termos varchar2(255),     
	valor NUMBER(10,2),     
        cliente REF tp_cliente,     
	anuncios tp_nt_anuncios   	    
);
/

CREATE TABLE TAB_PAIS  OF TP_PAIS NESTED TABLE localizacoes STORE AS nt_localizacao_t_P;

CREATE TABLE TAB_REVENDEDOR  OF TP_REVENDEDOR ( id PRIMARY KEY) NESTED TABLE paises STORE AS nt_paises_t (NESTED TABLE localizacoes STORE AS nt_localizacao_t);

CREATE TABLE TAB_escolhe OF tp_escolhe;

CREATE TABLE TAB_distribuida OF tp_distribuida;

CREATE TABLE TAB_EDICAO OF TP_EDICAO  ( cod PRIMARY KEY) NESTED TABLE anuncios STORE AS tb_l_anuncios;

CREATE TABLE TAB_compra OF tp_compra  NESTED TABLE anuncios STORE AS tb_ls_anuncios;

CREATE TABLE TAB_FOTOGRAFIA OF TP_FOTOGRAFIA  ( cod PRIMARY KEY);

CREATE TABLE tab_localizacao OF tp_localizacao;

CREATE TABLE TAB_ENDERECO OF TP_ENDERECO  ( cod PRIMARY KEY);

CREATE TABLE TAB_CONTATO OF TP_CONTATO ( cod PRIMARY KEY);

create table tab_departamento OF tp_departamento (     
	cod PRIMARY KEY,     
	nome NOT NULL     
);

CREATE TABLE TAB_DIRETOR_EXECUTIVO OF TP_DIRETOR_EXECUTIVO  (     
	id PRIMARY KEY,    
	contato SCOPE IS tab_contato,    
        endereco SCOPE IS tab_endereco,     
	setor SCOPE IS tab_departamento    
);

CREATE TABLE TAB_DIAGRAMADOR OF TP_DIAGRAMADOR (     
	id PRIMARY KEY,     
	CHECK (salario > 800),    
	contato SCOPE IS tab_contato,    
        endereco SCOPE IS tab_endereco,     
	setor SCOPE IS tab_departamento    
);

CREATE TABLE TAB_EDITOR OF TP_EDITOR (     
	id PRIMARY KEY,    
	contato SCOPE IS tab_contato,    
        endereco SCOPE IS tab_endereco,     
	setor SCOPE IS tab_departamento    
);

CREATE TABLE TAB_JORNALISTA OF TP_JORNALISTA (     
	id PRIMARY KEY,    
	contato SCOPE IS tab_contato,    
        endereco SCOPE IS tab_endereco,     
	setor SCOPE IS tab_departamento    
);

CREATE TABLE TAB_materia OF tp_materia (     
	cod PRIMARY KEY,     
	editor SCOPE IS tab_editor,    
        jornalista SCOPE IS tab_jornalista    
);

CREATE TABLE TAB_FOTOGRAFO OF TP_FOTOGRAFO (    
	id PRIMARY KEY,    
	contato SCOPE IS tab_contato,    
        endereco SCOPE IS tab_endereco,     
	setor SCOPE IS tab_departamento    
);

CREATE TABLE tab_caderno_tematico OF tp_caderno_tematico(    
	editor SCOPE IS tab_editor    
)NESTED TABLE materias STORE AS tb_l_materias;

CREATE TABLE TAB_ANUNCIO OF TP_ANUNCIO;

CREATE TABLE TAB_PESSOA_FISICA OF TP_PESSOA_FISICA  ( id PRIMARY KEY, CPF unique);

CREATE TABLE TAB_PESSOA_JURIDICA OF TP_PESSOA_JURIDICA ( id PRIMARY KEY, CNPJ unique);

ALTER TABLE tab_departamento MODIFY ( chefe WITH ROWID REFERENCES tab_diretor_executivo );

ALTER TABLE tab_edicao MODIFY ( responsavel SCOPE IS tab_diretor_executivo );

ALTER TABLE tab_fotografia MODIFY ( fotografo SCOPE IS tab_fotografo  );

ALTER TABLE tab_escolhe MODIFY (     
	foto SCOPE IS tab_FOTOGRAFIA,    
	materia SCOPE IS  tab_materia, 	    
	jornalista SCOPE IS tab_jornalista    
);

ALTER TABLE tab_pessoa_fisica MODIFY (     
	contato SCOPE IS tab_contato,    
	endereco SCOPE IS tab_endereco 	    
);

ALTER TABLE tab_pessoa_juridica MODIFY (     
	contato SCOPE IS tab_contato,    
	endereco SCOPE IS tab_endereco 	    
);

ALTER TABLE tab_revendedor MODIFY ( contato SCOPE IS tab_contato );

ALTER TABLE tab_distribuida MODIFY (     
	revendedor SCOPE IS tab_revendedor,    
	edicao SCOPE IS tab_edicao    
 );

-- Corpo dos métodos para tp_funcionario – método ORDER

CREATE OR REPLACE TYPE BODY tp_funcionario IS  MEMBER FUNCTION salarioAnual RETURN NUMBER IS     
    BEGIN     
        RETURN salario*12;     
    END;     
    ORDER MEMBER FUNCTION comparaSalario (x tp_funcionario)     
        RETURN INTEGER IS     
    BEGIN     
    RETURN SELF.salario - x.salario;     
    END;     
END; 
/

-- Corpo do tipo Diagramador
CREATE OR REPLACE TYPE BODY tp_diagramador AS   
    CONSTRUCTOR FUNCTION tp_diagramador (x1 tp_funcionario) RETURN   
    SELF AS RESULT IS   
        BEGIN   
            id := x1.id; salario := x1.salario; nome := x1.nome; data_nascimento := x1.data_nascimento; matricula := x1.matricula;   
            cpf := x1.cpf; data_admissao := x1.data_admissao; contato := x1.contato; endereco := x1.endereco;    
            RETURN;   
        END;   
    OVERRIDING MEMBER FUNCTION salarioAnual RETURN NUMBER IS   
        BEGIN   
            RETURN salario*12;   
    END;   
END;
/

-- Corpo do método fotografiaToCadeia
CREATE OR REPLACE TYPE BODY tp_fotografia AS FINAL MAP MEMBER FUNCTION fotografiaToCadeia RETURN VARCHAR2 IS     
    p VARCHAR2(255) := descricao;     
    BEGIN     
        RETURN p;     
    END;     
END; 
/

CREATE OR REPLACE TYPE BODY tp_revendedor AS FINAL MAP MEMBER FUNCTION buscar_CNPJ RETURN  VARCHAR2 IS  
    p VARCHAR2(255) := cnpj;  
    BEGIN  
        RETURN p;  
    END;  
END; 
/

-- -- Corpo do tipo Fotografo

CREATE OR REPLACE TYPE BODY tp_fotografo AS CONSTRUCTOR FUNCTION tp_fotografo (x1 tp_funcionario) RETURN  SELF AS RESULT IS  
    BEGIN  
        id := x1.id; salario := x1.salario; nome := x1.nome; data_nascimento := x1.data_nascimento; matricula := x1.matricula;  
        cpf := x1.cpf; data_admissao := x1.data_admissao; contato := x1.contato; endereco := x1.endereco;   
    RETURN;  
    END;  
        OVERRIDING MEMBER FUNCTION salarioAnual RETURN NUMBER IS  
    BEGIN  
        RETURN salario*12*1.1;  
    END;  
END;
/

-- Corpo dos métodos para o tipo tp_departamento

CREATE OR REPLACE TYPE BODY tp_departamento AS MEMBER PROCEDURE exibir_detalhes ( SELF IN OUT tp_departamento) IS 
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Departamentos' || 'CÓDIGO: ' ||TO_CHAR(cod)||'Nome: ' || nome || 'Fone: ' || TO_CHAR(fone)); 
    END; 
 
    MAP MEMBER FUNCTION departamentoTOInt RETURN INTEGER IS 
        p INTEGER := cod; 
    BEGIN 
        RETURN p; 
    END; 
END;
/


------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TYPE BODY tp_materia AS FINAL 
    MAP MEMBER FUNCTION lista_por_data RETURN timestamp IS
	    p timestamp := data_escrita;
	    BEGIN
		RETURN p;
	END;
END;
/

CREATE OR REPLACE TYPE body tp_edicao IS
  ORDER MEMBER FUNCTION func_order(x tp_edicao)  RETURN NUMBER IS
    BEGIN
        RETURN SELF.valor - X.valor;
    END;
END;
/


CREATE OR REPLACE TYPE BODY tp_pessoa_fisica AS
   CONSTRUCTOR FUNCTION tp_pessoa_fisica (v_cliente tp_cliente) RETURN SELF AS RESULT
   IS
   BEGIN
        id := v_cliente.id;
        contato := v_cliente.contato;
	    endereco :=  v_cliente.endereco;
        return;
   END;
 END;
/
-- construtores sobrecarregados
CREATE OR REPLACE TYPE BODY tp_localizacao AS
   CONSTRUCTOR FUNCTION tp_localizacao (v_cep VARCHAR2, v_estado VARCHAR2) RETURN SELF AS RESULT
   IS
   BEGIN
        cep := v_cep;
        estado := v_estado;
        return;
   END;
   CONSTRUCTOR FUNCTION tp_localizacao (v_cep VARCHAR2) RETURN SELF AS RESULT
   IS
   BEGIN
        cep := v_cep;
        return;
   END;
 END;
 


