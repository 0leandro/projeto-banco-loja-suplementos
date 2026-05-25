# Projeto Banco de Dados – Loja de Suplementos
Projeto desenvolvido para modelagem e implementação de um banco de dados para uma loja de suplementos.

# Objetivo
Desenvolver a modelagem e implementação de um banco de dados representando o funcionamento do sistema de uma loja de suplementos.

# Tecnologias utilizadas
MySQL Server
MySQL Workbench
SQL

# Estrutura do projeto
diagrama suplementos.mwb
Modelo EER editável do MySQL Workbench
loja_suplementos_mysql_antigo.sql`
Script de criação do banco de dados

# Entidades do banco
Clientes
Produtos
Categorias
Pedidos
Item_Pedidos

# Relacionamentos
Clientes → Pedidos (1:N)
Pedidos → Item_Pedidos (1:N)
Produtos → Item_Pedidos (1:N)
Categorias → Produtos (1:N)

# Funcionalidades implementadas
Criação de tabelas
Chaves primárias
Chaves estrangeiras
Relacionamentos
Inserção de dados
Consultas SQL## Autor
Léo
