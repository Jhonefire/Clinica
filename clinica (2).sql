-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Dez-2023 às 14:12
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `Id` int(11) NOT NULL,
  `Especialidade` int(11) NOT NULL,
  `Funcionario` int(11) NOT NULL,
  `Paciente` int(11) NOT NULL,
  `Data_consulta` date NOT NULL,
  `Horario_consulta` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `agendamentos`
--

INSERT INTO `agendamentos` (`Id`, `Especialidade`, `Funcionario`, `Paciente`, `Data_consulta`, `Horario_consulta`) VALUES
(1, 1, 20, 4, '2023-11-04', '15:19:00'),
(2, 1, 20, 4, '2023-11-04', '15:21:00'),
(3, 2, 21, 12, '2023-11-30', '11:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidades`
--

CREATE TABLE `especialidades` (
  `id_esp` int(11) NOT NULL,
  `descricao_esp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `especialidades`
--

INSERT INTO `especialidades` (`id_esp`, `descricao_esp`) VALUES
(1, 'Cardiologista'),
(2, 'Otorrinolaringologista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_func` int(11) NOT NULL,
  `nome_func` varchar(200) NOT NULL,
  `rg_func` varchar(15) NOT NULL,
  `cpf_func` varchar(15) NOT NULL,
  `cargo_func` varchar(30) NOT NULL,
  `senha_func` varchar(50) NOT NULL,
  `email_func` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_func`, `nome_func`, `rg_func`, `cpf_func`, `cargo_func`, `senha_func`, `email_func`) VALUES
(20, 'Thallys', '54.785.658-4', '512.648.957-21', '321546', '123', 'thallys@gmail.com'),
(21, 'Jhonny', '12312', '2121', 'wqwq', '123', 'joao@gmail'),
(22, 'hillary', '121', '1212', '123', '5453', NULL),
(23, 'augusto', '', '', '', '', NULL),
(24, 'Thallys Vinicius ', '123', '123', '123', '123', 'null');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos`
--

CREATE TABLE `grupos` (
  `Id` int(11) NOT NULL,
  `Descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `grupos`
--

INSERT INTO `grupos` (`Id`, `Descricao`) VALUES
(1, 'Administrador'),
(2, 'Medico'),
(3, 'Recepcao'),
(4, 'Paciente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `horario`
--

INSERT INTO `horario` (`id`, `hora`) VALUES
(1, '13:00:00'),
(2, '14:00:00'),
(3, '15:00:00'),
(4, '16:00:00'),
(5, '17:00:00'),
(6, '18:00:00'),
(7, '11:00:00'),
(8, '12:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`id`, `login`, `senha`) VALUES
(1, 'joao', '123'),
(2, 'thallys', '123'),
(3, 'hillary', '123'),
(4, 'matheus', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `Id` int(11) NOT NULL,
  `Grupo` int(11) NOT NULL,
  `Menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`Id`, `Grupo`, `Menu`) VALUES
(1, 1, 'Agendamentos'),
(2, 1, 'Pacientes'),
(3, 1, 'Funcionarios'),
(4, 1, 'Especialidades'),
(5, 3, 'Agendamentos'),
(6, 3, 'Pacientes'),
(7, 4, 'menu_pacientes'),
(8, 2, 'Agendamentos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `logradouro` varchar(30) NOT NULL,
  `celular` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `usa_medicam` varchar(5) NOT NULL,
  `estado` varchar(3) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `cpf`, `sexo`, `logradouro`, `celular`, `email`, `usa_medicam`, `estado`, `cidade`) VALUES
(4, 'Hillary', '45676534512', 'M', '43453543', '', '', '', '', ''),
(5, 'Thallys Vinicius', '51230808809', 'M', '1145657465', '', 'thallys@gmail.com', 'Não', 'SP', 'Mogi das Cruzes'),
(6, 'augusto', '', '', '', '', 'augusto@gmail.com', '', 'SP', 'Mogi das Cruzes'),
(9, 'JoÃ£o', '5454151', 'Masculino', '1235456', '', 'joao@gmail', 'SIm', 'SP', 'Mogi das Cruzes'),
(12, 'Thallys Viniciu', '123', 'Masculino', '11997378574', 'sasa', 'thallys.vinicius7@gmail.com', 'Nao', 'SP', 'MOGI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao`
--

CREATE TABLE `permissao` (
  `Id` int(11) NOT NULL,
  `Login` int(11) NOT NULL,
  `Grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `permissao`
--

INSERT INTO `permissao` (`Id`, `Login`, `Grupo`) VALUES
(1, 1, 4),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Especialidade` (`Especialidade`),
  ADD KEY `Funcionario` (`Funcionario`),
  ADD KEY `Paciente` (`Paciente`);

--
-- Índices para tabela `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_esp`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_func`);

--
-- Índices para tabela `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Grupo` (`Grupo`);

--
-- Índices para tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Login` (`Login`),
  ADD KEY `Grupo` (`Grupo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_esp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_func` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `grupos`
--
ALTER TABLE `grupos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `permissao`
--
ALTER TABLE `permissao`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`Especialidade`) REFERENCES `especialidades` (`id_esp`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`Funcionario`) REFERENCES `funcionarios` (`id_func`),
  ADD CONSTRAINT `agendamentos_ibfk_3` FOREIGN KEY (`Paciente`) REFERENCES `pacientes` (`id`);

--
-- Limitadores para a tabela `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`Grupo`) REFERENCES `grupos` (`Id`);

--
-- Limitadores para a tabela `permissao`
--
ALTER TABLE `permissao`
  ADD CONSTRAINT `permissao_ibfk_1` FOREIGN KEY (`Login`) REFERENCES `login` (`id`),
  ADD CONSTRAINT `permissao_ibfk_2` FOREIGN KEY (`Grupo`) REFERENCES `grupos` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
