use amaidoso; -- usando o bd

# ADICIONANDO DADOS PARA TESTES
    
# INSERINDO DADOS NA TABELA RESPONSAVEL
insert into responsavel(nome_responsavel, email, senha)
values
	('davi brito', 'davicuidador26@gmail.com', '$Davi_lindão'),
	('ronaldo cobresal', 'ronaldocobre@gmail.com', 'ronald.90##'),
	('marcelo gourmet','marcelo67gourmet@gmail.com', 'm.gourmet67');

# INSERINDO DADOS NA TABELA IDOSO
insert into idoso(nome_idoso, cpf, senha, data_nascimento, id_responsavel)
values
	('jose fagundes de jesus','51500986524','feijãoComfarinha','1940-12-20',1),
	('otavio neto moura','51404076524','loiradaU$P','1955-09-01',1),
	('claudio ferrugem','51520386524','folhasSilva1','1964-10-05',2);

# INSERINDO DADOS NA TABELA MEDICAMENTO
insert into medicacao(nome_medicamento, valor_dose, unidade_medida, intervalo_dias, data_inicio, hora_alarme, continuo, status_tomado,id_idoso)
values
	('dipirona', '33', 'gotas','5','2026-04-25', '08:00:00', true, false, 1),
	('dipirona', '31', 'gotas','1','2026-08-20', '20:00:00', true, true, 2),
	('dipirona', '35', 'gotas','7','2026-04-08', '12:00:00', false, false, 1),
	('dipirona', '28', 'gotas','30','2026-02-01', '10:00:00', false, true, 1);

# INSERINDO DADOS NA TABELA LEMBRETE
insert into lembrete(titulo, descricao, data_hora, endereco, id_idoso)
values
	('Consulta médica', 'Levar o Jefferson para sua consulta médica às 16:00 horas',
    '2026-03-19 16:00:00', 'Rua Vale da Estranheza, 67, ao lado do bar do moe, centro, santana de parnaíba, SP, 06501-000', 2),
	('Médico da Prostata', 'Exame de prostata',
    '2025-02-20 08:30:00', 'Rua Manoel Gomes, 666, vila das santas, São Paulo, SP, 06480-000', 1),
	('abc', 'Exame de prostata',
    '2025-02-20 08:30:00', 'Rua Manoel Gomes, 666, vila das santas, São Paulo, SP, 06480-000', 3);