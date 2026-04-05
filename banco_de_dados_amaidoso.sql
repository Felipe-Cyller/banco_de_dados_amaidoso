CREATE DATABASE amaidoso;
USE amaidoso;

-- ===================== IDOSO =====================
CREATE TABLE idoso (
    id_idoso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1),
    observacao TEXT
) ENGINE=InnoDB;

-- ===================== RESPONSAVEL =====================
CREATE TABLE responsavel (
    id_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(25),
    email VARCHAR(150),
    senha VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- ===================== MEDICACAO =====================
CREATE TABLE medicacao (
    id_medicacao INT AUTO_INCREMENT PRIMARY KEY,
    nome_medicamento VARCHAR(100) NOT NULL,
    quantidade_dosagem DECIMAL(5,2),
    unidade_dosagem VARCHAR(20)
) ENGINE=InnoDB;

-- ===================== IDOSO x MEDICACAO (N:N) =====================
CREATE TABLE idoso_medicacao (
    id_idoso INT,
    id_medicacao INT,

    PRIMARY KEY (id_idoso, id_medicacao),

    FOREIGN KEY (id_idoso)
        REFERENCES idoso(id_idoso)
        ON DELETE CASCADE,

    FOREIGN KEY (id_medicacao)
        REFERENCES medicacao(id_medicacao)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ===================== LEMBRETE =====================
CREATE TABLE lembrete (
    id_lembrete INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(500) NOT NULL,
    data_hora_lembrete DATETIME NOT NULL,
    endereco VARCHAR(100),

    id_responsavel INT NOT NULL,
    id_idoso INT NULL,

    FOREIGN KEY (id_responsavel)
        REFERENCES responsavel(id_responsavel)
        ON DELETE CASCADE,

    FOREIGN KEY (id_idoso)
        REFERENCES idoso(id_idoso)
        ON DELETE SET NULL
) ENGINE=InnoDB;

-- ===================== ANOTACAO =====================
CREATE TABLE anotacao (
    id_anotacao INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT,

    id_idoso INT,

    FOREIGN KEY (id_idoso)
        REFERENCES idoso(id_idoso)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ===================== NOTIFICACAO =====================
CREATE TABLE notificacao (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(30),
    mensagem TEXT,
    data_envio_notificacao DATETIME NOT NULL
) ENGINE=InnoDB;

-- ===================== DESTINATARIO =====================
CREATE TABLE destinatario (
    id_destinatario INT AUTO_INCREMENT PRIMARY KEY,
    id_notificacao INT NOT NULL,

    id_responsavel INT NULL,
    id_idoso INT NULL,

    lida BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (id_notificacao)
        REFERENCES notificacao(id_notificacao)
        ON DELETE CASCADE,

    FOREIGN KEY (id_responsavel)
        REFERENCES responsavel(id_responsavel)
        ON DELETE CASCADE,

    FOREIGN KEY (id_idoso)
        REFERENCES idoso(id_idoso)
        ON DELETE CASCADE
) ENGINE=InnoDB;
