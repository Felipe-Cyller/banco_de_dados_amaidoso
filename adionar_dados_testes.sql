USE amaidoso;

-- ===================== IDOSO =====================
INSERT INTO idoso (nome, data_nascimento, sexo, observacao) VALUES
('José da Silva', '1945-03-10', 'M', 'Diabético'),
('Maria Oliveira', '1950-07-22', 'F', 'Hipertensa');

-- ===================== RESPONSAVEL =====================
INSERT INTO responsavel (nome, telefone, email, senha) VALUES
('Carlos Silva', '11999999999', 'carlos@email.com', '123456'),
('Ana Souza', '11988888888', 'ana@email.com', 'abcdef');

-- ===================== MEDICACAO =====================
INSERT INTO medicacao (nome_medicamento, quantidade_dosagem, unidade_dosagem) VALUES
('Paracetamol', 500, 'mg'),
('Insulina', 10, 'ml');

-- ===================== IDOSO x MEDICACAO =====================
INSERT INTO idoso_medicacao (id_idoso, id_medicacao) VALUES
(1, 1),
(1, 2),
(2, 1);

-- ===================== LEMBRETE =====================
INSERT INTO lembrete (descricao, data_hora_lembrete, endereco, id_responsavel, id_idoso) VALUES
('Tomar remédio', '2026-04-05 08:00:00', 'Casa', 1, 1),
('Consulta médica', '2026-04-06 10:00:00', 'Hospital', 2, 2),
('Comprar remédio', '2026-04-07 15:00:00', 'Farmácia', 1, NULL);

-- ===================== ANOTACAO =====================
INSERT INTO anotacao (descricao, id_idoso) VALUES
('Paciente apresentou melhora', 1),
('Pressão alta hoje', 2);

-- ===================== NOTIFICACAO =====================
INSERT INTO notificacao (titulo, mensagem, data_envio_notificacao) VALUES
('Hora do remédio', 'Está na hora de tomar o remédio', '2026-04-05 08:00:00'),
('Confirmação', 'O idoso tomou a medicação', '2026-04-05 08:10:00');

-- ===================== DESTINATARIO =====================
-- Para idoso
INSERT INTO destinatario (id_notificacao, id_idoso, lida) VALUES
(1, 1, FALSE);

-- Para responsável
INSERT INTO destinatario (id_notificacao, id_responsavel, lida) VALUES
(2, 1, FALSE);
