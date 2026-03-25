use amaidoso; -- usando o bd

# ADICIONANDO DADOS PARA TESTES
    
# INSERINDO DADOS NA TABELA RESPONSAVEL
insert into responsavel(nome_responsavel, cpf, telefone, email, senha)
values
	('davi','51599082710', '(11) 91867-8756', 'davicuidador26@gmail.com', '$Davi_lindão');

# INSERINDO DADOS NA TABELA IDOSO
insert into idoso(nome_idoso, dt_nasc, sexo, cpf, observacoes,id_responsavel)
values
	('jose','1990-12-20', 'm','51500986524','é um velho muito chato',1),
	('arnalda','1950-09-23', 'f','51556398323','é uma velha legal',1);

# INSERINDO DADOS NA TABELA MEDICAMENTO
insert into medicacao(nome_medicamento, dosagem, horario, id_idoso)
values
	('dipirona', '10ml', '2026-03-24 20:20:00',1);