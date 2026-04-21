use amaidoso; -- usando o bd

# COMANDOS PARA TESTAR O BANCO DE DADOS

# SELECT's
select * from responsavel; -- tabela responsavel
select * from idoso; -- tabela idoso
select * from medicacao; -- tabela medicação
select * from lembrete; -- tabela lembrete
select * from anotacao; -- tabela anotacao
select * from observacao; -- tabela observação

# DROP's (USAR COM CUIDADO)
drop table responsavel;
drop table idoso;
drop table medicacao;
drop table lembrete;
drop table anotacao;
drop table observacao;


# DELETE's
delete from responsavel;
delete from idoso;
delete from medicacao;
delete from lembrete;

# TRUNCATE
drop database amaidoso;

truncate responsavel;
truncate idoso;
truncate lembrete;
truncate medicacao;
