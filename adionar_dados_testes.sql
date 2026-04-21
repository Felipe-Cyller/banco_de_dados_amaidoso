use amaidoso; -- usando o bd

# ALTERAR DADOS NAS TABELAS

-- Adicionando a coluna foto_perfil para idoso e responsavel

alter table responsavel add column foto_perfil varchar(255) default "imagem_padrao.png"; -- Adicionando a coluna foto perfil
alter table idoso add column foto_perfil varchar(255) default "imagem_padrao.png"; -- Adicionado a coluna foto perfil
alter table idoso add check(data_nascimento > '1899-12-12'); -- Adicionando a checagem de idade minima

# ADICIONANDO DADOS PARA TESTES
    
# INSERINDO DADOS NA TABELA RESPONSAVEL
insert into responsavel(nome_responsavel, foto_perfil, email, senha)
values
	('davi brito','selfie.png', 'davicuidador26@gmail.com', '$Davi_lindão'),
	('ronaldo cobresal','a.jpg', 'ronaldocobre@gmail.com', 'ronald.90##'),
	('marcelo gourmet','Jefferson.png','marcelo67gourmet@gmail.com', 'm.gourmet67');

# INSERINDO DADOS NA TABELA IDOSO
insert into idoso(nome_idoso, foto_perfil, cpf, senha, data_nascimento, id_responsavel)
values
	('jose fagundes de jesus', 'Cam_2026-05-20.png','51500986524','feijãoComfarinha','1940-12-20',1),
	('otavio neto moura','Whatsapp.png','51404076524','loiradaU$P','1955-09-01',2),
	('claudio ferrugem','fotooo.jpeg','51520386524','folhasSilva1','1964-10-05',3);
    
insert into idoso(nome_idoso, foto_perfil, cpf, senha, data_nascimento, id_responsavel)
values
('Usuario teste', 'compia.png', '68197899001', 'paulaFernades$$', '1898-10-29',2);
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
    '2026-02-20 08:30:00', 'Rua Manoel Gomes, 666, vila das santas, São Paulo, SP, 06480-000', 1),
	('abc', 'Exame de prostata',
    '2026-02-20 08:30:00', 'Rua Manoel Gomes, 666, vila das santas, São Paulo, SP, 06480-000', 3);
    
# INSERINDO DADOS NA TABELA ANOTAÇÃO
insert into anotacao(descricao, id_idoso)
values
	('Compra um cigarro toda semana', 1),
    ('Ir no aniversario da matilde', 2),
    ('Comprar carvao para o churrasco', 2);
    
# INSERINDO DADOS NA TABELA OBSERVAÇÃO
insert into observacao(titulo, descricao, id_idoso)
values
	('Ir no Parque','Levar esse defunto ambulante no parque',2),
	('Passatempo','Jogar xadrez para passar o tempo',1),
	('Banho a cada 2 dias','Dar banho nesse velho a cada dois dias para economizar na agua',3),
	('Comprar tenis novos','Comprar tenis novos na loja da esquina, tamanho 35',2);