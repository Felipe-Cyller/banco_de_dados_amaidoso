use amaidoso; -- usando o bd

# COMANDOS PARA TESTAR O BANCO DE DADOS

# SELECT's
select * from responsavel; -- tabela responsavel
select * from idoso; -- tabela idoso
select * from medicacao; -- tabela medicação
select * from lembrete; -- tabela lembrete

# DROP's
drop table responsavel;
drop table idoso;
drop table medicacao;
drop table lembrete;


# DELETE's
delete from responsavel;
delete from idoso;
delete from medicacao;
delete from lembrete;

# TRUNCATE
drop database amaidoso;

truncate lembrete;
truncate medicacao;
