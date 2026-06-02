-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/06/2026 às 13:52
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produtos`
--
CREATE DATABASE IF NOT EXISTS `produtos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `produtos`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`, `descricao`) VALUES
(1, 'Eletrônico', 'Aparelhos eletrônicos, câmeras, tablets, notebooks e computadores'),
(2, 'Limpeza', 'Produtos e itens para limpeza'),
(3, 'Decoração', 'Itens para decoração'),
(4, 'Alimentos', 'Itens alimentícios para consumo'),
(5, 'Congelados', 'Itens congelados para consumo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `product`
--

CREATE TABLE `product` (
  `idproduto` int(11) NOT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `nomeproduto` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `datacadastro` date NOT NULL,
  `ativo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `product`
--

INSERT INTO `product` (`idproduto`, `idcategoria`, `nomeproduto`, `preco`, `qtde`, `datacadastro`, `ativo`) VALUES
(1, 1, 'Mouse Gamer', 89.90, 20, '2026-01-12', b'1'),
(2, 1, 'Teclado Mecânico', 199.90, 4, '2026-02-05', b'1'),
(3, 1, 'Monitor 24 Polegadas', 899.90, 2, '2026-03-18', b'1'),
(4, 2, 'Shampoo', 18.90, 2, '2026-01-25', b'1'),
(5, 2, 'Sabonete Líquido', 9.90, 7, '2026-02-14', b'1'),
(6, 2, 'Creme Dental', 6.50, 3, '2026-04-02', b'1'),
(7, 3, 'Vaso de Planta', 35.90, 1, '2026-03-01', b'1'),
(8, 3, 'Pá de Jardim', 24.90, 10, '2026-03-22', b'1'),
(9, 3, 'Mangueira', 59.90, 1, '2026-05-10', b'1'),
(10, 4, 'Refrigerante', 8.99, 3, '2026-01-30', b'1'),
(11, 4, 'Suco de Uva', 12.90, 2, '2026-04-18', b'1'),
(12, 4, 'Água Mineral', 2.50, 7, '2026-05-05', b'1'),
(13, 5, 'Bola de Futebol', 79.90, 10, '2026-02-28', b'1'),
(14, 5, 'Corda de Pular', 19.90, 1, '2026-04-25', b'1'),
(15, 5, 'Luva de Goleiro', 49.90, 1, '2026-05-28', b'1');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices de tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
