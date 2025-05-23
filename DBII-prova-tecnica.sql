CREATE DATABASE pascotto1;
USE pascotto1;

CREATE TABLE fornecedor(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (250),
    cnpj VARCHAR (50),
    telefone VARCHAR (50),
	cpf VARCHAR (50)
);

CREATE TABLE produtos(
	idproduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100),
    preco DECIMAL,
    quantidadeestoque INT,
    idfornecedor INT,
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (idfornecedor) REFERENCES fornecedor (idfornecedor)
);

CREATE TABLE cargos (
	idCargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (50),
    descricao VARCHAR (250)
);

CREATE TABLE colaborador (
	idColaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (250),
    idcargo INT,
    salario DECIMAL,
	CONSTRAINT fk_colaborador_cargo FOREIGN KEY (idcargo) REFERENCES cargos (idcargo)
);

CREATE TABLE pedidos (
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
	dataPedido DATE,
	quantidade INT,
	idColaborador INT,
	idProduto INT,
	CONSTRAINT fk_pedido_colaborador FOREIGN KEY (idColaborador) REFERENCES colaborador (idColaborador),
	CONSTRAINT fk_pedido_produto FOREIGN KEY (idProduto) REFERENCES produtos (idProduto)
);

ALTER TABLE fornecedor ADD email VARCHAR (100);

CREATE TABLE categorias (
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
	nomeCategoria VARCHAR (100)
);
    
ALTER TABLE produtos ADD id_categoria INT;
ALTER TABLE produtos ADD CONSTRAINT fk_produto_categoria FOREIGN KEY (idCategoria) REFERENCES categorias (idCategoria);

INSERT INTO fornecedor (nome, cnpj, telefone, cpf, email) VALUES
("Pao frances", "12.456.784/0001-00", "+55 (11) 91234-6147", "123.456.789-22", "padaria@gmail.com"),
("bicoito", "98.765.432/0001-11", "+55 (11) 99876-5432", "987.654.321-33", "cookie@gmail.com");
INSERT INTO categorias (nome_categoria) VALUES
("padaria"),
("doces");
INSERT INTO produtos (nome, preco, quantidadeEstoque, idFornecedor, idCategoria) VALUES
("pao frances", 11.55, 50, 1, 1),
("cookie", 12.29, 44, 2, 2);
INSERT INTO cargos (nome, descricao) VALUES
("vendedor", "Realiza as Vendas"),
("grente", "Gerencia a Loja");
INSERT INTO colaborador (nome, idCargo, salario) VALUES
("eloisa", 2, 5000.00),
("julia", 1, 2249.00);
INSERT INTO pedidos (dataPedido, quantidade, idColaborador, idProduto) VALUES
("24032025", 5, 2, 1),
("15062025", 7, 2, 2);

ALTER TABLE fornecedor DROP cpf;





UPDATE colaborador SET salario = 2500 WHERE idColaborador = 1;
select A.nome = B.nome from produtos A inner join fornecedor B
on a.id_produto = b.id_fornecedor;