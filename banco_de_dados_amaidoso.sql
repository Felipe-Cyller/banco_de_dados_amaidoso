# CRIAÇÃO DO BANCO DE DADOS
create database amaidoso; -- criando o bd
use amaidoso; -- usando o bd

#CRIAÇÃO DAS TABELAS

# TABELA RESPONSÁVEL
create table responsavel(

	id_responsavel integer primary key auto_increment,
    nome_responsavel varchar(100) not null, -- armazena o nome do responsavel
    foto_perfil varchar(255) default "imagem_padrao.png", -- foto de perfil
    
    -- LOGIN E IDENTIFICAÇÃO
	email varchar(200) unique not null, -- email unico para impedir usuario cadastrado com o mesmo email
    senha varchar(255) not null, -- Senha de login (Varchar longo para suportar criptografia)
    
    -- TRAVAS DE SEGURANÇA
    check(trim(nome_responsavel) <> ""), -- Impede nome só com espaços
    check(email like '%_@__%.__%') -- Verifica se o email enviado corresponde a uma estrutura minima de um email
);

# TABELA IDOSO
create table idoso(

    id_idoso integer primary key auto_increment,
    nome_idoso varchar(100) not null, -- armazena o nome completo do idoso
    foto_perfil varchar(255) default "imagem_padrao.png", -- foto do idoso em formato de caminho de imagem
    
    -- LOGIN E IDENTIFICAÇÃO
	cpf varchar(11) unique not null, -- para não existir nenhum usuário idoso com mesmo cpf
    senha varchar(255) not null, -- senha de login (Varchar longo para suportar criptografia)
    
    -- DADOS PESSOAIS
    data_nascimento date not null, -- armazena a data de nascimento

    -- RELACIONAMENTO
    id_responsavel integer not null,
    foreign key(id_responsavel) references responsavel(id_responsavel)
    on delete cascade, -- Se o responsável sair, apaga o idoso
    
    -- TRAVAS DE SEGURANÇA
    check(trim(nome_idoso) <> ""), -- Impede nome só com espaço
    check(char_length(cpf) = 11), -- garante que o cpf tenha exatamnete 11 caracteres
    check(data_nascimento > '1899-12-12') -- para garantir que o idoso cadastrado esteja minimamente vivo
);

# TABELA MEDICAÇÃO
create table medicacao(

	id_medicacao integer primary key auto_increment,
    nome_medicamento varchar(80) not null,
    
    -- INFORMAÇÃO DA MEDICAÇÃO
    valor_dose decimal(10,2) not null, -- o valor da dose é como o 100 de 100mg ou o 20 de 20 gotas
    unidade_medida enum('mg','ml','gotas','colher','comprimido') not null, -- o enum cria uma lista para que nenhum valor
    -- fora do permitido seja registrado nessa coluna
    
    -- FREQUÊNCIA DA MEDICAÇÃO
    intervalo_dias integer, -- Intervalo em dias para ficar melhor para calcular o alarme
    data_inicio date not null, -- data de inicio
    hora_alarme time not null, -- hora em que o alarme tocará
    continuo boolean default false, -- uso continuo por padrão é falso
    status_tomado boolean default false, -- status para saber se o idoso tomou a medicação. sendo falso o valor padrão
    
    -- RELACIONAMENTO
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
    on delete cascade, -- Quando o registro do idoso for excluido apaga o esse registro também
    
    -- TRAVAS DE SEGURANÇA
    check(trim(nome_medicamento) <> ""), -- Não pode ser espaço
    check(valor_dose > 0), -- Dose tem que ser maior que zero
    check(intervalo_dias >= 0) -- Os dias não podem ser negativos
);

# TABELA LEMBRETE
create table lembrete(

	id_lembrete integer primary key auto_increment,
    
    -- INFORMAÇÃO DO LEMBRETE
    titulo varchar(35) not null, -- titulo do lembrete
    descricao varchar(300) not null, -- descrição do lembrete
    data_hora datetime not null, -- armazena a data e a hora do lembrete
    endereco varchar(100), -- endereço para onde o idoso tem que ir
    
    -- RELACIONAMENTO
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
    on delete cascade, -- Se o idoso for deletado, o lembrete some também
    
    -- TRAVAS DE SEGURANÇA
	check(trim(titulo) <> ""), -- Bloqueia o registro vazio no titulo
    check(trim(descricao) <> ""),
    check(data_hora > '2026-01-01 00:00:00') -- Para garantir datas correntes
);

# TABELA ANOTAÇÕES
create table anotacao(
	
    id_anotacao integer primary key auto_increment,
    descricao text not null,
    
    -- RELACIONAMENTO
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
    on delete cascade,
    
    -- TRAVAS DE SEGURANÇA
    check(trim(descricao) <> "") -- para não armazenar o espaço ou string vazia
);

# TABELA OBSERVAÇÃO
create table observacao(
	id_observacao integer primary key auto_increment,
    titulo varchar(35) not null, -- titulo da observação
    descricao varchar(300) not null, -- descrição da observação
    
    -- RELACIONAMENTO
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso)
    on delete cascade,
    
    -- TRAVAS DE SEGURANÇA
    check(trim(titulo) <> ""),
    check(trim(descricao) <> "") 
);

# TABELA NOTICAÇÃO -- TALVEZ NEM USE MAS DEIXE AQUI CASO PRECISAR (precisa revisar caso for usar)
/*
create table notificacao(

	id_notificacao integer primary key auto_increment,
    titulo varchar(50) not null,
    mensagem text not null,
    dt_envio datetime not null,
    
    id_idoso integer not null,
    foreign key(id_idoso) references idoso(id_idoso),
    
    id_responsavel integer not null,
    foreign key(id_responsavel) references responsavel(id_responsavel)
);
*/