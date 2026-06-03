-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jun-2026 às 21:13
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

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
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`, `descricao`) VALUES
(1, 'Eletrônico', 'Aparelhos eletrônicos, câmeras, tablets, notebooks e computadores'),
(2, 'Limpeza', 'Produtos e itens para limpeza'),
(3, 'Decoração', 'Itens para decoração'),
(4, 'Alimentos', 'Itens alimentícios para consumo'),
(5, 'Congelados', 'Itens congelados para consumo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `product`
--

CREATE TABLE `product` (
  `idproduto` int(11) NOT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `nomeproduto` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `datacadastro` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `marca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `product`
--

INSERT INTO `product` (`idproduto`, `idcategoria`, `nomeproduto`, `preco`, `qtde`, `datacadastro`, `ativo`, `marca`) VALUES
(1, 1, 'Mouse Gamer', '89.90', 20, '2026-01-12', b'1', 'mancer'),
(2, 1, 'Teclado Mecânico', '199.90', 4, '2026-02-05', b'1', 'rayzer'),
(3, 1, 'Monitor 24 Polegadas', '899.90', 2, '2026-03-18', b'1', 'acer'),
(4, 2, 'Shampoo', '18.90', 2, '2026-01-25', b'1', 'clear man'),
(5, 2, 'Sabonete Líquido', '9.90', 7, '2026-02-14', b'1', 'palmolive'),
(6, 2, 'Creme Dental', '6.50', 3, '2026-04-02', b'1', 'colgate'),
(7, 3, 'Vaso de Planta', '35.90', 1, '2026-03-01', b'1', 'ts-brasil'),
(8, 3, 'Pá de Jardim', '24.90', 10, '2026-03-22', b'1', 'tramontina'),
(9, 3, 'Mangueira', '59.90', 1, '2026-05-10', b'1', 'tramontina'),
(10, 4, 'Refrigerante', '8.99', 3, '2026-01-30', b'1', 'x-tapa'),
(11, 4, 'Suco de Uva', '12.90', 2, '2026-04-18', b'1', 'maráta'),
(12, 4, 'Água Mineral', '2.50', 7, '2026-05-05', b'1', 'Crystal'),
(13, 5, 'Bola de Futebol', '79.90', 10, '2026-02-28', b'1', 'Adidas'),
(14, 5, 'Corda de Pular', '19.90', 1, '2026-04-25', b'1', 'vollo'),
(15, 5, 'Luva de Goleiro', '49.90', 1, '2026-05-28', b'1', 'nike');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
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
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
