
CREATE DATABASE IF NOT EXISTS loja_suplementos;
USE loja_suplementos;

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Cpf VARCHAR(11),
    Email VARCHAR(100),
    Telefone VARCHAR(15),
    Data_Nascimento DATE,
    Endereco_Entrega VARCHAR(255)
);

CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50),
    Descricao VARCHAR(255)
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Razao_Social VARCHAR(100),
    CNPJ VARCHAR(14),
    Email_Contato VARCHAR(100),
    Telefone_Contato VARCHAR(15)
);

CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Descricao TEXT,
    Sabor VARCHAR(30),
    Peso_Volume VARCHAR(20),
    Preco_Venda DECIMAL(10,2),
    Quantidade_Estoque INT,
    fk_Categoria_ID_Categoria INT,
    fk_Fornecedor_ID_Fornecedor INT,
    FOREIGN KEY (fk_Categoria_ID_Categoria)
        REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (fk_Fornecedor_ID_Fornecedor)
        REFERENCES Fornecedor(ID_Fornecedor)
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Data_Hora DATETIME,
    Valor_Total DECIMAL(10,2),
    Status VARCHAR(20),
    Metodo_Pagamento VARCHAR(30),
    fk_Cliente_ID_Cliente INT,
    FOREIGN KEY (fk_Cliente_ID_Cliente)
        REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Item_Pedido (
    ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    Quantidade INT,
    Preco_Unitario DECIMAL(10,2)
);

CREATE TABLE Contem (
    fk_Item_Pedido_ID_Item INT,
    fk_Produto_ID_Produto INT,
    fk_Pedido_ID_Pedido INT,

    PRIMARY KEY (
        fk_Item_Pedido_ID_Item,
        fk_Produto_ID_Produto,
        fk_Pedido_ID_Pedido
    ),

    FOREIGN KEY (fk_Item_Pedido_ID_Item)
        REFERENCES Item_Pedido(ID_Item),

    FOREIGN KEY (fk_Produto_ID_Produto)
        REFERENCES Produto(ID_Produto),

    FOREIGN KEY (fk_Pedido_ID_Pedido)
        REFERENCES Pedido(ID_Pedido)
);

INSERT INTO Categoria (Nome,Descricao)
VALUES
('Whey','Proteínas'),
('Creatina','Suplemento para força'),
('Pré-treino','Energia');

INSERT INTO Fornecedor
(Razao_Social,CNPJ,Email_Contato,Telefone_Contato)
VALUES
('Max Suplementos','12345678000199','contato@max.com','11999999999');

INSERT INTO Cliente
(Nome,Cpf,Email,Telefone,Data_Nascimento,Endereco_Entrega)
VALUES
('Leo Silva','12345678901','leo@email.com',
'11999999999','2005-01-10','Rua A, 123');

INSERT INTO Produto
(Nome,Descricao,Sabor,Peso_Volume,Preco_Venda,
Quantidade_Estoque,fk_Categoria_ID_Categoria,
fk_Fornecedor_ID_Fornecedor)
VALUES
('Whey Protein','Proteína premium',
'Chocolate','900g',149.90,30,1,1);
