-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Fev-2019 às 19:10
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_mari_barber`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_saidas`
--

CREATE TABLE `tb_saidas` (
  `id_saida` int(11) NOT NULL,
  `descricao_saida` varchar(250) COLLATE utf8_bin NOT NULL,
  `valor_saida` int(5) NOT NULL,
  `data_saida` date NOT NULL,
  `hora_saida` varchar(5) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_serviços`
--

CREATE TABLE `tb_serviços` (
  `id_serviço` int(11) NOT NULL,
  `tipo_serviço` varchar(500) COLLATE utf8_bin NOT NULL,
  `valor_serviço` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tb_serviços`
--

INSERT INTO `tb_serviços` (`id_serviço`, `tipo_serviço`, `valor_serviço`) VALUES
(1, 'Corte', 20),
(2, 'Selagem', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_serviço_cliente`
--

CREATE TABLE `tb_serviço_cliente` (
  `id_serviço_cliente` int(5) NOT NULL,
  `id_usuario_serviço_cliente` int(5) NOT NULL,
  `id_tipo_serviço_cliente` int(5) NOT NULL,
  `nome_serviço_cliente` varchar(250) COLLATE utf8_bin NOT NULL,
  `data_serviço_cliente` date NOT NULL,
  `horario_serviço_cliente` varchar(8) COLLATE utf8_bin NOT NULL,
  `validaçao_serviço_cliente` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tb_serviço_cliente`
--

INSERT INTO `tb_serviço_cliente` (`id_serviço_cliente`, `id_usuario_serviço_cliente`, `id_tipo_serviço_cliente`, `nome_serviço_cliente`, `data_serviço_cliente`, `horario_serviço_cliente`, `validaçao_serviço_cliente`) VALUES
(1, 1, 1, 'Geann Bosca', '2019-02-07', '12:00', 0),
(2, 1, 2, 'Geann Bosco', '2019-02-07', '12:00', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(250) COLLATE utf8_bin NOT NULL,
  `tipo_usuario` int(1) NOT NULL,
  `telefone_usuario` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `login_usuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha_usuario` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `nome_usuario`, `tipo_usuario`, `telefone_usuario`, `login_usuario`, `senha_usuario`) VALUES
(1, 'Mari Alves', 1, '(85) 99629-9478', 'maribarber', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_saidas`
--
ALTER TABLE `tb_saidas`
  ADD PRIMARY KEY (`id_saida`);

--
-- Indexes for table `tb_serviços`
--
ALTER TABLE `tb_serviços`
  ADD PRIMARY KEY (`id_serviço`);

--
-- Indexes for table `tb_serviço_cliente`
--
ALTER TABLE `tb_serviço_cliente`
  ADD PRIMARY KEY (`id_serviço_cliente`),
  ADD KEY `id_usuario_serviço_cliente` (`id_usuario_serviço_cliente`),
  ADD KEY `id_tipo_serviço_cliente` (`id_tipo_serviço_cliente`);

--
-- Indexes for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_saidas`
--
ALTER TABLE `tb_saidas`
  MODIFY `id_saida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_serviços`
--
ALTER TABLE `tb_serviços`
  MODIFY `id_serviço` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_serviço_cliente`
--
ALTER TABLE `tb_serviço_cliente`
  MODIFY `id_serviço_cliente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_serviço_cliente`
--
ALTER TABLE `tb_serviço_cliente`
  ADD CONSTRAINT `tb_serviço_cliente_ibfk_1` FOREIGN KEY (`id_usuario_serviço_cliente`) REFERENCES `tb_usuario` (`id_usuario`),
  ADD CONSTRAINT `tb_serviço_cliente_ibfk_2` FOREIGN KEY (`id_tipo_serviço_cliente`) REFERENCES `tb_serviços` (`id_serviço`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
