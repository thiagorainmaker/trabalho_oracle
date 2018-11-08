-- Endereço - Conferido
insert into tab_endereco values( tp_endereco(4,'3442423','Rua das Holandesas','133'));
insert into tab_endereco values( tp_endereco(7,'5432423','Av. Eusebio Dantas','12'));
insert into tab_endereco values( tp_endereco(5,'12323423','Rua Sarmento Ferreira','121'));
insert into tab_endereco values( tp_endereco(12,'98723423','Rua das Flores','1233'));
insert into tab_endereco values(tp_endereco (9,'33423423','Rodavia Marajá','345'));
insert into tab_endereco values(tp_endereco(10,'3873423','Av. Euclides Fernandes','1334'));
insert into tab_endereco values(tp_endereco(11 ,'14423423','Av. Nossa Senhorade Fatima','1760'));
insert into tab_endereco values( tp_endereco(30,'2342233','Av. dos Amadores','133'));
insert into tab_endereco values( tp_endereco(43,'3555423','Rua das Margaridas','1333'));
insert into tab_endereco values( tp_endereco(60,'54323423','Av. Eusebio XXI','1564'));
insert into tab_endereco values( tp_endereco(34,'1232773','Rua TeodoroFerreira','23121'));
insert into tab_endereco values( tp_endereco(35,'987887423','Rua das Flechas','123366'));
insert into tab_endereco values(tp_endereco (36,'3342314423','Rodavia 64','34566'));
insert into tab_endereco values(tp_endereco(37,'38734239894','Av. Teles Fernandes','133422'));
insert into tab_endereco values(tp_endereco(38 ,'14424453','Av. Nossa Senhorade Aparecida','21760'));


--Contato - Conferido
insert into tab_contato values(tp_contato(1, '8345657666', '93459999'));
insert into tab_contato values(tp_contato(2, '789321636', '99966799'));
insert into tab_contato values(tp_contato(3, '455126634', '99998879'));
insert into tab_contato values(tp_contato(4, '2234156632', '99939957'));
insert into tab_contato values(tp_contato(5, '4456326667', '99991969'));
insert into tab_contato values(tp_contato(6, '112246666', '99994432'));
insert into tab_contato values(tp_contato(7, '889564666', '99911213'));
insert into tab_contato values(tp_contato(8, '122366666', '99994324'));
insert into tab_contato values(tp_contato(9, '663334566', '99977893'));
insert into tab_contato values(tp_contato(10, '123466554', '99431113'));

---- INSERT DE CLIENTES - PESSOAS FÍSICAS E JURIDICAS
insert into TAB_PESSOA_FISICA values( Tp_PESSOA_FISICA(1, (SELECT REF(P) FROM tab_contato P WHERE cod = 5), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 9),'61111111', '1456434111') );
	
insert into TAB_PESSOA_FISICA values( Tp_PESSOA_FISICA(2, (SELECT REF(P) FROM tab_contato P WHERE cod = 4), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 7),'233545111', '145646111111') );

insert into TAB_PESSOA_FISICA values( Tp_PESSOA_FISICA(3, (SELECT REF(P) FROM tab_contato P WHERE cod = 7), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 3),'234751435', '14564351111') );	

insert into TAB_PESSOA_juridica values( Tp_PESSOA_juridica(1, (SELECT REF(P) FROM tab_contato P WHERE cod = 8), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 8),'345345111111', '14566111') );
	

--Revendedor - Conferido
insert into TAB_REVENDEDOR values(TP_REVENDEDOR(7, (SELECT REF(P) FROM tab_contato P WHERE cod = 9),'1112341', 'Banca do Joel', 
 nt_tp_paises( 
    tp_pais('Lituania', nt_tp_localizacao(
        tp_localizacao(640, 'Avenue Tres Bien','332','Ristn', 'Yazck'),
        tp_localizacao(590, '93091 Palleta Trhik','2323','Venice','Litz')
    )), 
    tp_pais('Peru', nt_tp_localizacao(
        tp_localizacao(4100, '20 Catedral des Croisints', '1730', 'Lima', 'Lima')
    )), 
    tp_pais('Brazil', nt_tp_localizacao(
        tp_localizacao(2900, '8204 Rua das Ribeiras St', '1223123', 'Lago Azul', 'Brasilia'),
        tp_localizacao(2600, '1233 Praça da Cidanina', '64048130', 'Teresina', 'Piaui')
    ))
    )
));

insert into TAB_REVENDEDOR values(TP_REVENDEDOR(1, (SELECT REF(P) FROM tab_contato P WHERE cod = 1),
'1234566', 'Joel Store', 
nt_tp_paises( 
    tp_pais('Lituania', nt_tp_localizacao(
        tp_localizacao(640, 'Avenue Tres Bien','332','Ristn', 'Yazck'),
        tp_localizacao(590, '93091 Palleta Trhik','2323','Venice','Litz')
    )), 
    tp_pais('Peru', nt_tp_localizacao(
        tp_localizacao(4100, '20 Catedral des Croisints', '1730', 'Lima', 'Lima')
    )), 
    tp_pais('Brazil', nt_tp_localizacao(
        tp_localizacao(2900, '8204 Rua das Ribeiras St', '1223123', 'Lago Azul', 'Brasilia'),
        tp_localizacao(2600, '1233 Praça da Cidanina', '64048130', 'Teresina', 'Piaui')
    ))
    )
));


insert into TAB_REVENDEDOR values(TP_REVENDEDOR(2, (SELECT REF(P) FROM tab_contato P WHERE cod = 2), '666221366', 'LOJA DO ZÉ', 
nt_tp_paises( 
    tp_pais('ITÁLIA', nt_tp_localizacao(
        tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''),
        tp_localizacao(1100, '93091 Calle della Testa','10934','Venice','')
    )), 
    tp_pais('SUIÇA', nt_tp_localizacao(
        tp_localizacao(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve'),
        tp_localizacao(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE')
    )), 
    tp_pais('United Kingdom', nt_tp_localizacao(
        tp_localizacao(2400, '8204 Arthur St', '', 'London', 'London'),
        tp_localizacao(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford')
    ))
    )
));

insert into TAB_REVENDEDOR values(TP_REVENDEDOR(3, (SELECT REF(P) FROM tab_contato P WHERE cod = 3), '88876832', 'JOÃO STORE', 
nt_tp_paises( 
    tp_pais('BRASIL', nt_tp_localizacao(
        tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''),
        tp_localizacao(1100, '93091 Calle della Testa','10934','Venice','')
    )), 
    tp_pais('RUSSIA', nt_tp_localizacao(
        tp_localizacao(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve'),
        tp_localizacao(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE')
    )), 
    tp_pais('United Kingdom', nt_tp_localizacao(
        tp_localizacao(2400, '8204 Arthur St', '', 'London', 'London'),
        tp_localizacao(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford')
    ))
    )
));




insert into TAB_REVENDEDOR values(TP_REVENDEDOR(4, (SELECT REF(P) FROM tab_contato P WHERE cod = 4), '99341999', 'BANCA O GLOBO', 
nt_tp_paises( 
    tp_pais('INDIA', nt_tp_localizacao(
        tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''),
        tp_localizacao(1100, '93091 Calle della Testa','10934','Venice','')
    )), 
    tp_pais('CHILE', nt_tp_localizacao(
        tp_localizacao(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve'),
        tp_localizacao(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE')
    )), 
    tp_pais('MÉXICO', nt_tp_localizacao(
        tp_localizacao(2400, '8204 Arthur St', '', 'London', 'London'),
        tp_localizacao(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford')
    ))
    )
));
insert into TAB_REVENDEDOR values(TP_REVENDEDOR(5,(SELECT REF(P) FROM tab_contato P WHERE cod = 5),'23133333', 'Lhomme Targeta French', 
nt_tp_paises( 
    tp_pais('França', nt_tp_localizacao(
        tp_localizacao(620, 'Avenue La Femme','532','Ristn', 'Yazck'),
        tp_localizacao(520, 'Sebatian Napoleon','2333','Bourdeux','Bourdeux')
    )), 
    tp_pais('Colombia', nt_tp_localizacao(
        tp_localizacao(4600, '2 La Playa', '132', 'Cancun', 'Cancun')
    )), 
    tp_pais('Argentina', nt_tp_localizacao(
        tp_localizacao(130, '23 Timbau', '24321', 'Tres Marias', 'Guadalupe'),
        tp_localizacao(300, '198 Praça La paz', '22222', 'Buenos Aires', 'Prata')
    ))
    )
));

insert into TAB_REVENDEDOR values(TP_REVENDEDOR(6, (SELECT REF(P) FROM tab_contato P WHERE cod = 10),'188', 'Museo Liberdad', 
nt_tp_paises( 
    tp_pais('Chile', nt_tp_localizacao(
        tp_localizacao(6310, 'Avenue Lisboa','232','Valparaiso', 'Valparaaiso'),
        tp_localizacao(4320, 'Sebatian Sá','11253','Pablo Neruda','Santiago')
    )), 
    tp_pais('Uruguai', nt_tp_localizacao(
        tp_localizacao(4980, '233 La Cordilheira', '13222', 'Montevideo', 'Montevideo')
    )), 
    tp_pais('Paraguai', nt_tp_localizacao(
        tp_localizacao(730, '23 Timbau', '2234', 'Santa Lize', 'Guadalupe'),
        tp_localizacao(1100, '19 La Mujer', '562', 'Buenos Dias', 'Plata')
    ))
    )
));

--Distribuição Edição 

insert into TAB_distribuida values (
    tp_distribuida( 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        500,  
        (SELECT REF(P) FROM tab_edicao P WHERE cod = 1), 
        (SELECT REF(P) FROM TAB_REVENDEDOR P WHERE id = 6)
        ));


insert into TAB_distribuida values (
    tp_distribuida( 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        700,  
        (SELECT REF(P) FROM tab_edicao P WHERE cod = 2), 
        (SELECT REF(P) FROM TAB_REVENDEDOR P WHERE id = 5)
        ));
        
insert into TAB_distribuida values (
    tp_distribuida( 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        500,  
        (SELECT REF(P) FROM tab_edicao P WHERE cod = 4), 
        (SELECT REF(P) FROM TAB_REVENDEDOR P WHERE id = 3)
        ));

insert into TAB_distribuida values (
    tp_distribuida( 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        700,  
        (SELECT REF(P) FROM tab_edicao P WHERE cod = 1), 
        (SELECT REF(P) FROM TAB_REVENDEDOR P WHERE id = 4)
        ));

insert into TAB_distribuida values (
    tp_distribuida( 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        500,  
        (SELECT REF(P) FROM tab_edicao P WHERE cod = 3), 
        (SELECT REF(P) FROM TAB_REVENDEDOR P WHERE id = 4)
        ));


insert into TAB_distribuida values (
    tp_distribuida( 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        300.33,  
        (SELECT REF(P) FROM tab_edicao P WHERE cod = 1), 
        (SELECT REF(P) FROM TAB_REVENDEDOR P WHERE id = 3)
        ));

-- Compras - Conferido
insert into tab_compra values (
    tp_compra(
        TO_DATE('25/09/2017', 'dd/mm/yyyy'), 
        'Anuncios', 
        250.25,
        (SELECT REF(P) FROM TAB_PESSOA_juridica P WHERE id = 2), 
        tp_nt_anuncios(
            tp_anuncio('10X10', 'Lindo apartamento mobiliado e com vista para o mar, apenas 300.000', 'Apartamento - Rua das Acaceas', 58.60),
            tp_anuncio('60X10', 'A Clinica Gisleuda conta com uma equipe tecnica capacitada e com uma infraestrutura singular', 'Gisleuda Fisioterapia', 100),
            tp_anuncio('60X70', 'Bateu o carro? Danificou a estrutura do seu veículo, na Martelinho de ouro seu carro sai como novo. Vem pra cáLigue  3344-34555', 'Martelinho de Ouro', 360),
            tp_anuncio('90X80', 'Trazemos de volta seu amor em 30 dias! Seus inimigos lhe perseguem? Persiga eles também.', 'Casa Exoterica - Mãe Lucinda', 450),
            tp_anuncio('10X20', 'Nossa baleia de estimaçãopariu um filhotinho saudavel, nossa piscina não comporta mais que três baleias, infelizmente não podemos ficar com ele. Caso haja interesse ligar para 4554-8966. Preço a Acordar.', 'Filhote de Baleia Joubat',69.30)
        )
    )
);

insert into tab_compra values (
    tp_compra(
        TO_DATE('23/10/2017', 'dd/mm/yyyy'), 
        'Classificados', 
        560.25,
        (SELECT REF(P) FROM TAB_PESSOA_juridica P WHERE id = 3), 
        tp_nt_anuncios(
            tp_anuncio('10X10', 'O melhor arrumadinho da cidade em sua festa. Contrate nosso buffet regional e ganha desconto de 30%. Desconto Valido para os 10 primeiros clientes', 'Dona Neca - Cozinheiras', 58.60),
            tp_anuncio('60X10', 'Tudo para um louvor de qualidade. Roupas para evangelicas, biblias personalidzadas e objetos aben�oados', 'Sabrina Louva Deus', 100),
            tp_anuncio('60X70', 'Plantas orientais,  Bonsais, ornamentos budistas e Bambus Onamentais', ' Floricultura Li', 360),
            tp_anuncio('90X80', 'Cerveja gelada? Sarapateu de Bode? Um bom brega? Venha para o Bar da D. Dica. Happy Hour as Ter�as.', 'Bar da Dona Dica', 450),
            tp_anuncio('10X20', 'Lugar discreto com áreas exclusivas para casais e pessoas de bem', 'Casa de Encontro',69.30),
            tp_anuncio('20X20', 'Chopana Potyguara, proxima a São Miguel do Gostoso. 3 quartos, 2 banheiros, lago particular', 'Chopana no Mato', 65.60)
        )
    )
);

insert into tab_compra values (
    tp_compra(
        TO_DATE('22/01/2017', 'dd/mm/yyyy'), 
        'Classificados', 
        360.25,
        (SELECT REF(P) FROM TAB_PESSOA_juridica P WHERE id = 5), 
        tp_nt_anuncios(
            tp_anuncio('10X10', 'O melhor da comida Mineira em sua casa. Ganha desconto de 50%, trazendo o jornal consigo', 'Cozinha Mineira', 58.60),
            tp_anuncio('60X10', 'A Boutique das servas de Cristo', 'Tati Louva Deus', 100),
            tp_anuncio('60X70', 'Ornamentos de Casamento, Guirlanda de Natal, Ramalhete de Flores', ' Florisbella', 360),
            tp_anuncio('90X80', 'Garantimos nota fria, obras inacabadas e amparo juridico.', 'Construtora Caixa 2', 450),
            tp_anuncio('10X20', 'Sua internet de qualidade por 79.90', 'Wi-fi Net',69.30),
            tp_anuncio('20X20', 'Uma edição distopica do futuro não tão distante', 'Sky Net', 65.60)
        )
    )
);

--Fotografia - Conferido

INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 8,
    TO_DATE( '2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    'FEMINICIDIO.jpg', 
     NULL, 
    'LOCALIDADE SANTA FÉ', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 2))
);


INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 1,
    TO_DATE( '2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    'DESCRIÇÃO DA IMG', 
     NULL, 
    'LOCAL DA FOTO', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 1))
);

INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 2,
    TO_DATE( '01/11/2011 21:02:44', 'dd/mm/yyyy hh24:mi:ss'), 
    'Ciranda-cras.jp', 
     NULL, 
    'CRAS PB', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 5))
);
INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 3,
    TO_DATE( '11/11/2014 02:02:44', 'dd/mm/yyyy hh24:mi:ss'), 
    'Festa-Caixa2.jp', 
     NULL, 
    'Caixa 2 - Deputado Bodó', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 2))
);

INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 4,
    TO_DATE( '01/11/2011 21:02:44', 'dd/mm/yyyy hh24:mi:ss'), 
    'Festa.jp', 
     NULL, 
    'Casa Deputado Bom jardim', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 3))
);

INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 5,
    TO_DATE( '12/11/2018 09:02:44', 'dd/mm/yyyy hh24:mi:ss'), 
    'Confra-p2.jp', 
     NULL, 
    'IFPB', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 4))
);

INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 6,
    TO_DATE( '06/05/2014 21:02:44', 'dd/mm/yyyy hh24:mi:ss'), 
    'Dosie.png', 
     NULL, 
    'Peti-PI', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 5))
);
INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 7,
    TO_DATE( '12/10/2013 02:02:44', 'dd/mm/yyyy hh24:mi:ss'), 
    'Propina.png', 
     NULL, 
    'Ministro Casa Civil', 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 3))
);


--Diretor Executivo

insert into tab_diretor_executivo values ( 
tp_diretor_executivo( 
	1,
	4500,
	'João das Neves',  
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	6623555,  
	'00381111865',   
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  
	(SELECT REF(P) FROM tab_contato P WHERE cod = 3),  
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 6), 
	NULL, 
	NULL,
	NULL 
));



insert into tab_diretor_executivo values ( 
tp_diretor_executivo( 
	5,
	4500,
	'João Maria Silva',  
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	6623555,  
	'00381111865',   
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  
	(SELECT REF(P) FROM tab_contato P WHERE cod = 3),  
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 6), 
	NULL, 
	NULL,
	NULL 
));

insert into tab_diretor_executivo values ( 
tp_diretor_executivo( 
	4, 
	4500,
	'Joana Prado',  
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	6665985,  
	'02355331111',   
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  
	(SELECT REF(P) FROM tab_contato P WHERE cod = 2),  
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 5), 
	NULL, 
	NULL,
	NULL 
));

insert into tab_diretor_executivo values ( 
tp_diretor_executivo( 
	7,
	5500,
	'Lizieux Lindóia',  
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	666335,  
	'02111021',   
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  
	(SELECT REF(P) FROM tab_contato P WHERE cod = 2),  
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 7), 
	NULL, 
	NULL,
	NULL 
));

insert into tab_diretor_executivo values ( 
tp_diretor_executivo( 
	8, 
	3700,
	'Lousine Del Toro',  
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	6665364,  
	'0230106641',   
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  
	(SELECT REF(P) FROM tab_contato P WHERE cod = 4),  
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 11), 
	NULL, 
	NULL,
	NULL 
));

insert into tab_diretor_executivo values (
tp_diretor_executivo(
	9,
	5090.00, 
	'Carminha Tecuteco', 
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, 
	'001038466',  
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 1), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 1),
	NULL,
	NULL,
	NULL
));

insert into tab_diretor_executivo values ( 
tp_diretor_executivo( 
	16,  
	3000,
	'Andreia Pipira',  
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	6665567,  
	'00103841111',   
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  
	(SELECT REF(P) FROM tab_contato P WHERE cod = 5),  
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 6), 
	NULL, 
	NULL,
	NULL
));

insert into tab_diretor_executivo values ( 
tp_diretor_executivo( 
	18,  
	3000,
	'Andrei Pipa',  
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	6665567,  
	'00103841111',   
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  
	(SELECT REF(P) FROM tab_contato P WHERE cod = 5),  
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 6), 
	NULL, 
	NULL,
	NULL
));

--Departamento
insert into tab_departamento values(
    tp_departamento(
        4,
        'Fotografia',
	'551223555',
        (SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 16)
    )
);
insert into tab_departamento values(
    tp_departamento(
        3,
        'Jornalismo',
	'55553345',
        (SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 9)
    )
);
insert into tab_departamento values(
    tp_departamento(
        5,
        'Edição',
	'2223632',
        (SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 7)
    )
);

insert into tab_departamento values(
    tp_departamento(
        2,
        'Diagramação',
	'12344455',
        (SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 7)
    )
);

insert into tab_departamento values(
    tp_departamento(
        17,
        'Design',
	'1236755',
       (SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 9)
    )
);

insert into tab_departamento values(
    tp_departamento(
        18,
        'Almoxarifado',
	'1234224455',
       (SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 16)
    )
);

--Editor
insert into tab_editor values (
TP_editor(1, 3800.00,  'Louise Caleb', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '234234234', TO_DATE('2017/06/12 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 3), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 3),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1)), 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 5) 
));

insert into tab_editor values (
TP_editor(2, 3400.00,  'Cintia Diniz', TO_DATE('1989/05/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '23423423', TO_DATE('2017/03/12 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 6), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 5),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 3)), 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 5) 
));

insert into tab_editor values (
TP_editor(3, 3300.00,  'MARIA DAS GRAÇAS', TO_DATE('1989/08/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '837438243', TO_DATE('2017/06/12 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 2), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 3),
	(SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 4), 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 5) 
));

insert into tab_editor values (
TP_editor(4, 3800.00,  'MARIANA DE SOUSA', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '98723213', TO_DATE('2014/07/16 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 5), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 4),
	NULL, 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 5 ) 
));

 
--Diagramador
insert into tab_diagramador values (
TP_diagramador(1, 2500.00,  'Fernando Fernandes', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	622555, '123123123', TO_DATE('2017/02/07 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 6), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 5),
	NULL, 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4)
	
));

insert into tab_diagramador values (
TP_diagramador(2, 1500.00,  'Alice Ribeira', TO_DATE('1990/11/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6665678, '1231233453', TO_DATE('2017/02/13 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 1), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 4),
	NULL, 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4) 
));

insert into tab_diagramador values (
TP_diagramador(4, 2500.00,  'Livia Gavino', TO_DATE('1979/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6665332, '12312312', TO_DATE('2017/06/12 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 2), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 2),
	(SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1), 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4) 
)); 
--Fotografo - Conferido

insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(2, 3200.00, 'Lisbela das neves', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	661855, '43552534', 
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 3), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 5),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 9)),
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4) 
));

insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(3, 3200.00, 'Livia Andrade', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6623355, '543534535', 
	TO_DATE('2017/02/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 3), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 7),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 4)),
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4) 
));

insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(4, 3700.00, 'João Lindóia', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6634555, '123123123', 
	TO_DATE('2007/10/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 7), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 38),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 7)),
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4) 
));

insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(5, 3200.00, 'Gabriel Gadelha', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6665123, '53456788', 
	TO_DATE('2016/03/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 6), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 11),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 16)),
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4) 
));

insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(6, 2300.00, 'Ketlin Ramalho', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6622255, '5467778', 
	TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 5), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 30),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 4)),
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 5) 
));

insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(7, 2200.00, 'Salomão Judá', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6663325, '78796775', 
	TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 5), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 37),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 9)),
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 4) 
));



--Jornalista
insert into tab_JORNALISTA values (
TP_JORNALISTA(1, 4500.00,  'JULIANA AMORIN', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6623455, '2313421', TO_DATE('2017/06/12 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 3), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 3),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1)), 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 1) 
));

insert into tab_JORNALISTA values (
TP_JORNALISTA(2, 5500.00,  'JULIAN GODOI', TO_DATE('1986/11/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	6665234, '23423234', TO_DATE('2017/06/12 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 2), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 5),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1)), 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 1) 
));

insert into tab_JORNALISTA values (
TP_JORNALISTA(3, 2500.00,  'CALEB ANCIÃO', TO_DATE('1985/08/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '23423477', TO_DATE('2017/02/20 13:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 4), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 6),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1)), 
	(SELECT REF(P) FROM tab_departamento P WHERE cod = 1) 
));

-- Edicao
insert into tab_edicao values (
    tp_edicao(
        2,
        5.40, 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
        (SELECT REF(P) FROM tab_diretor_executivo P WHERE ID = 1) ,
        tp_cadernos(
                    tp_caderno_tematico('descrição genérica', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    ))),
        tp_nt_anuncios(
            tp_anuncio('30X10', 'Massagem corporral Tantrica', 'Levando ao Céu - Massagem', 68.60), 
            tp_anuncio('40X10', 'Bulldogs de Pedigree', 'BullNILL', 98.60), 
            tp_anuncio('20X10', 'Podologia in Home', 'Saúde dos Pés', 88.60), 
            tp_anuncio('50X10', 'Um corpo perfeito para uma vida fake', 'Estetica Corporal', 158.60), 
            tp_anuncio('10X10', 'Seus filhos na linha', 'Paulo Adestrador', 58.60), 
            tp_anuncio('20X10', 'Tudo que precisa para aquela Mega festa em sua casa', 'Super Bar', 70.60), 
            tp_anuncio('10X10', 'Remedios que curam vindos da natureza  ', 'Vida Canabica', 58.60)
        )
        
        ));


insert into tab_edicao values (
    tp_edicao(
        1,
        7.40, 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
        (SELECT REF(P) FROM tab_diretor_executivo P WHERE ID = 1) ,
        tp_cadernos(
                    tp_caderno_tematico('descrição genérica', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    )), 

 tp_caderno_tematico('descrição genérica', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    )), 


 tp_caderno_tematico('descrição genérica', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    )), 

 tp_caderno_tematico('descrição genérica', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    ))
),
        tp_nt_anuncios(
            tp_anuncio('30X10', 'Massagem corporral Tantrica', 'Levando ao Céu - Massagem', 68.60), 
            tp_anuncio('40X10', 'Bulldogs de Pedigree', 'BullNILL', 98.60), 
            tp_anuncio('20X10', 'Podologia in Home', 'Saúde dos Pés', 88.60), 
            tp_anuncio('50X10', 'Um corpo perfeito para uma vida fake', 'Estetica Corporal', 158.60), 
            tp_anuncio('10X10', 'Seus filhos na linha', 'Paulo Adestrador', 58.60), 
            tp_anuncio('20X10', 'Tudo que precisa para aquela Mega festa em sua casa', 'Super Bar', 70.60), 
            tp_anuncio('10X10', 'Remedios que curam vindos da natureza  ', 'Vida Canabica', 58.60)
        )
        
        ));
--Materia

insert into TAB_MATERIA values(
TP_MATERIA(1, 'LEAD DA MATÉRIA', 'MANCHETE BRASIL', 'tEMPOS SOMBRIO ADENTRAM PORTA ADENTRO. BRASIL SE TORNA UM PAIS COM FACISMO EM DESGOVERNO', 'DITADURA ABRE A PORTA', 
TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
tp_qualificador(1, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
));


insert into TAB_MATERIA values(
TP_MATERIA(2, 'LEAD DA MATÉRIA 2', 'Hotel Pensilvania BRASIL', 'ROTA TURISTA MACRABRA VIRA ASSUNTO GLOBAL QUANDO CORPOS APARECEM EM LAGOAS ARTIFICIAIS', 'Turismo Macabro ', 
TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
tp_qualificador(2, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 2))
));

insert into TAB_MATERIA values(
TP_MATERIA(3, 'LEAD DA MATÉRIA 2', 'Cordilheira de Sangue', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'Cores Vermelhas Tomam de Conta ', 
TO_DATE('2015/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2008/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
tp_qualificador(3, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 3))
));


insert into TAB_MATERIA values(
TP_MATERIA(4, 'LEAD DA MATÉRIA 4', 'Aritmetica Cerebral', 'TEXTO ALEATÓRIO DA MATÉRIA ... 4 ', 'Neurociencia ', 
TO_DATE('2014/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
TO_DATE('2020/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
tp_qualificador(4, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
));

insert into TAB_MATERIA values(
TP_MATERIA(11, 'LEAD DA MATÉRIA', 'Cosmologia dos Seres', 'Vicent, astronauta Brasileiro, ganhou o primeiro passaporte pra MArte', 'Cosmo na Escola', 
TO_DATE('2019/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2007/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
tp_qualificador(1, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 3))
));




insert into tab_caderno_tematico values ( 


                    tp_caderno_tematico('policial', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'matéria policial 1', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'matéria policial 2', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'matéria policial 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    ))

);





insert into tab_caderno_tematico values ( 


                    tp_caderno_tematico('política', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'ex Governador de Goiás é preso', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'Manchete política 2', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'Manchete política 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    ))

);





insert into tab_caderno_tematico values ( 


                    tp_caderno_tematico('esportes', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 3), 
		    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),  -- data revisao
	            (SELECT REF(P) FROM tab_editor P WHERE id = 1),  -- editor
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'Palmeiras não tem mundial', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 3), 
                        tp_qualificador(8, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'Brasil 1 x 7 Alemanha', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 2), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(9, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'MANCHETE ESPORTIVA - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 2), 
                        tp_qualificador(10, 1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1))
                        )
                    
                    ))

);


INSERT INTO tab_escolhe VALUES(
    (SELECT REF(P) FROM tab_fotografia P WHERE cod = 1),
    TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    (SELECT REF(P) FROM tab_materia P WHERE cod = 1),
    (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1)
);

