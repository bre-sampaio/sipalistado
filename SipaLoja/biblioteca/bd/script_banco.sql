DROP DATABASE mvcd;
CREATE DATABASE mvcd;

USE mvcd;

CREATE TABLE IF NOT EXISTS `mvcd`.`usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `papel` VARCHAR(100) NOT NULL DEFAULT 'usuario'
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8

INSERT INTO `mvcd`.`usuario` (`nome`, `senha`, `email`, `papel`) VALUES ('admin', '123', 'admin@admin', 'admin');
INSERT INTO `mvcd`.`usuario` (`nome`, `senha`, `email`, `papel`) VALUES ('usuario', '123', 'usuario@usuario', 'usuario');


/*sipa loja*/

/* SCRIPT CLIENTE */

	CREATE DATABASE sipaloja;

	USE sipaloja;
	
CREATE TABLE cliente(
	idcliente int NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	senha VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	nascimento VARCHAR(10) NOT NULL,
	sexo VARCHAR(1) NOT NULL,
	PRIMARY KEY (idcliente)
	);


CREATE TABLE IF NOT EXISTS produto(
	idProduto INT(11) NOT NULL AUTO_INCREMENT,
	Preco DOUBLE NOT NULL,
	NomeProduto VARCHAR(30) NOT NULL,
	Descricao VARCHAR(60) NOT NULL,
	Tamanho VARCHAR(60) NOT NULL,
	Imagem VARCHAR(60) NOT NULL,
	Sexo VARCHAR(1) NOT NULL,
	Categoria VARCHAR(20) NOT NULL,
	Estoque_Min INT(5) NOT NULL,
	Estoque_Max INT(5) NOT NULL,
	PRIMARY KEY(idProduto)
);


CREATE TABLE IF NOT EXISTS cupom(
	idCupom INT(8) NOT NULL,
	NomeCupom VARCHAR(20) NOT NULL,
	Desconto INT(8) NOT NULL,
	PRIMARY KEY(idCupom)
);


CREATE TABLE IF NOT EXISTS log_produto(
	ID_Log INT(11) NOT NULL,
	Tabela VARCHAR(45) NOT NULL,
	Usuario VARCHAR(45) NOT NULL,
	Data_Hora DATETIME NOT NULL,
	Acao VARCHAR(45) NOT NULL,
	Dados VARCHAR(1000) NOT NULL,
	PRIMARY KEY(ID_Log)
);


CREATE TABLE IF NOT EXISTS endereco(
	idEndereco INT(11) NOT NULL,
	idUsuario INT (11) NOT NULL,
	Logradouro VARCHAR(20) NOT NULL,
	Complemento VARCHAR(20),
	Bairro VARCHAR(30) NOT NULL,
	Cidade VARCHAR(30) NOT NULL,
	CEP VARCHAR(8) NOT NULL,
	PRIMARY KEY(idEndereco, idUsuario),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS  pedido (
	idPedido INT(11) NOT NULL,
	idUsuario INT(11) NOT NULL,
	idEndereco INT(11) NOT NULL,
	dataCompra DATE NOT NULL,
	PRIMARY KEY(idUsuario, idEndereco),
	FOREIGN KEY(idUsuario) REFERENCES usuario(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(idEndereco) REFERENCES endereco(idEndereco) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS pedido_produto(
	idProduto INT(11) NOT NULL,
	idPedido INT(11) NOT NULL,
	Quantidade INT(11) NOT NULL,
	PRIMARY KEY(idProduto, idPedido),
	FOREIGN KEY(idProduto) REFERENCES produto(idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(idPedido) REFERENCES pedido(idPedido) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS estoque(
	idEstoque INT(11) NOT NULL,
	idProduto INT(11) NOT NULL,
	Quantidade INT(11) NOT NULL,
	PRIMARY KEY(idEstoque),
	FOREIGN KEY(idProduto) REFERENCES produto(idProduto) ON UPDATE CASCADE ON DELETE CASCADE
);


create table categoria(
idCategoria varchar(15) NOT NULL,
idProduto int(11) NOT NULL,
primary key(idCategoria),
foreign key(idProduto) REFERENCES produto(idProduto) ON UPDATE CASCADE ON DELETE CASCADE
);

	
