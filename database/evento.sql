-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para eventos
CREATE DATABASE IF NOT EXISTS `eventos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `eventos`;

-- Copiando estrutura para tabela eventos.evento
CREATE TABLE IF NOT EXISTS `evento` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_evento` varchar(250) NOT NULL,
  `data_evento` datetime NOT NULL,
  `local_evento` varchar(250) NOT NULL,
  `descricao_evento` text NOT NULL,
  PRIMARY KEY (`evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela eventos.evento: ~3 rows (aproximadamente)
INSERT INTO `evento` (`evento_id`, `nome_evento`, `data_evento`, `local_evento`, `descricao_evento`) VALUES
	(2, 'Reunião de Equipe', '2024-01-15 00:00:00', 'Sala de Reuniões', 'Discussão sobre os projetos do próximo semestre'),
	(7, 'Conferência Internacional', '2024-04-05 00:00:00', 'Hotel XYZ', 'Conferência sobre globalização e mercados emergentes'),
	(9, 'Palestra Motivacional', '2024-05-01 00:00:00', 'Auditório', 'Palestra sobre como manter a motivação em tempos de crise');

-- Copiando estrutura para tabela eventos.eventos_participantes
CREATE TABLE IF NOT EXISTS `eventos_participantes` (
  `id_eventos_participantes` int(11) NOT NULL AUTO_INCREMENT,
  `evento_id` int(11) NOT NULL,
  `participante_id` int(11) NOT NULL,
  PRIMARY KEY (`id_eventos_participantes`),
  KEY `FK_eventos_participantes_evento` (`evento_id`),
  KEY `FK_eventos_participantes_participante` (`participante_id`),
  CONSTRAINT `FK_eventos_participantes_evento` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eventos_participantes_participante` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`participante_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela eventos.eventos_participantes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela eventos.organizadores
CREATE TABLE IF NOT EXISTS `organizadores` (
  `id_organizadores` int(11) NOT NULL AUTO_INCREMENT,
  `nome_organizador` varchar(255) NOT NULL DEFAULT '0',
  `email_organizador` varchar(255) NOT NULL,
  `senha_organizador` varchar(80) NOT NULL,
  PRIMARY KEY (`id_organizadores`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela eventos.organizadores: ~1 rows (aproximadamente)
INSERT INTO `organizadores` (`id_organizadores`, `nome_organizador`, `email_organizador`, `senha_organizador`) VALUES
	(1, 'gabriel', 'gabriel@gmail.com', '1234');
        (1, 'gabriel', 'gabrielribeiros1nul@gmail.com', '$10$epNK8DeanHVEMR2TXEZKbeE9JUcoTXPBomNH7r0rKjo');

-- Copiando estrutura para tabela eventos.participante
CREATE TABLE IF NOT EXISTS `participante` (
  `participante_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_participante` varchar(250) NOT NULL,
  `cpf_participante` int(11) NOT NULL,
  `telefone_participante` int(11) NOT NULL,
  `email_participante` varchar(500) NOT NULL,
  PRIMARY KEY (`participante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela eventos.participante: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
