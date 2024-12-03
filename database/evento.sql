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
INSERT INTO eventos (nome_evento, data_evento, local_evento, descricao_evento) VALUES
('Festa na Casa das Primas', '2024-12-10 20:00:00', 'Casa das Primas, Zona Norte', 'Uma noite de muita música, dança e diversão com a galera animada. Não perca!'),
('Churrasco do Fim de Semana', '2024-12-12 15:00:00', 'Chácara da Família, SP', 'Vamos fazer aquele churras com direito a cerveja gelada, música e boas risadas.'),
('Aniversário da Tia Lu', '2024-12-15 17:00:00', 'Casa da Tia Lu, Zona Sul', 'Festa de aniversário com direito a bolo, docinhos e aquela diversão entre a família.'),
('Festa do Pijama', '2024-12-20 19:00:00', 'Casa da Maria, Zona Leste', 'Noite de filme, pipoca, e risadas com as amigas. A diversão está garantida!'),
('Festa de Aniversário do João', '2024-12-22 18:30:00', 'Casa do João, Zona Oeste', 'Vamos celebrar o aniversário do João com muita música, comida e diversão!'),
('Luau na Praia', '2024-12-23 21:00:00', 'Praia de Copacabana, Rio de Janeiro', 'Luau com amigos na praia, violão, fogueira e muita diversão ao som do mar.'),
('Festa Surpresa para o Pedro', '2024-12-25 20:00:00', 'Casa do Pedro, SP', 'Festa surpresa para o Pedro com decoração temática, música e muita animação.'),
('Reveillon na Casa dos Amigos', '2024-12-31 22:00:00', 'Casa do Ricardo, Zona Oeste', 'Comemore a chegada do Ano Novo com muita animação, fogos de artifício e drinks especiais.'),
('Encontro de Férias na Praia', '2025-01-05 14:00:00', 'Praia de Bertioga', 'Reunião com os amigos na praia, esportes, cerveja e muita diversão.'),
('Festa de Aniversário da Raquel', '2025-01-10 16:00:00', 'Casa da Raquel, Centro SP', 'Comemore o aniversário da Raquel com muitos jogos, música boa e comida deliciosa.'),
('Bailinho na Casa do Marcos', '2025-01-12 23:00:00', 'Casa do Marcos, Zona Norte', 'Festa com música, dança e muito calor humano. Venha curtir até o amanhecer!'),
('Festa de Verão na Piscina', '2025-01-15 16:30:00', 'Chácara do André, SP', 'Festa com direito a piscina, drinks gelados e música animada. Venha se refrescar!'),
('Festa de Carnaval do Bloco do Zé', '2025-02-14 18:00:00', 'Rua do Zé, Centro SP', 'Venha curtir o Carnaval com o bloco mais animado da cidade. Confete, serpentina e muita folia!'),
('Aniversário da Amanda', '2025-02-18 17:30:00', 'Casa da Amanda, Zona Sul', 'Uma festa de aniversário com direito a balões, música animada e um bolo maravilhoso.'),
('Festa do Povo no Sítio', '2025-02-25 13:00:00', 'Sítio da Família Souza', 'Vamos celebrar com uma festa no sítio, música ao vivo e comida caseira. Não pode faltar!'),
('Festa de Fim de Tarde no Jardim', '2025-03-05 18:30:00', 'Casa do Vinícius, Zona Norte', 'Festa ao ar livre com um sunset incrível, música de violão e muitas conversas boas.'),
('Festa do Chá de Panela da Clara', '2025-03-10 14:00:00', 'Casa da Clara, Zona Leste', 'Chá de panela com decoração fofa, brincadeiras e muitas risadas. Vem celebrar com a gente!'),
('Festa dos Amigos no Apê', '2025-03-12 22:00:00', 'Apartamento do Guilherme, Zona Oeste', 'Festa em clima de amizade e diversão, com música eletrônica e drinks para todos!'),
('Festa de 15 Anos da Bia', '2025-03-20 20:00:00', 'Casa da Bia, Centro SP', 'Festa de 15 anos com direito a decoração temática, DJ e muita dança até a madrugada.'),
('Piquenique Musical no Parque', '2025-04-05 11:00:00', 'Parque Ibirapuera, SP', 'Venha para um piquenique com música ao vivo e muita diversão ao ar livre. Traga sua cesta!'),
('Festa da Cerveja Artesanal', '2025-04-10 16:00:00', 'Chácara do Bruno, Zona Norte', 'Festa com degustação de cervejas artesanais e comida de boteco. Para os amantes de cerveja!');


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

INSERT INTO participantes (nome_participante, cpf_participante, telefone_participante, email_participante) VALUES
('Ana Silva', 12345678901, 11987654321, 'ana.silva@gmail.com'),
('Carlos Pereira', 23456789012, 11976543210, 'carlos.pereira@yahoo.com.br'),
('Juliana Costa', 34567890123, 11965432109, 'juliana.costa@hotmail.com'),
('Marcos Oliveira', 45678901234, 11954321098, 'marcos.oliveira@outlook.com'),
('Roberta Santos', 56789012345, 11943210987, 'roberta.santos@terra.com.br'),
('Lucas Almeida', 67890123456, 11932109876, 'lucas.almeida@gmail.com'),
('Fernanda Costa', 78901234567, 11921098765, 'fernanda.costa@yahoo.com.br'),
('Pedro Souza', 89012345678, 11910987654, 'pedro.souza@hotmail.com'),
('Mariana Lima', 90123456789, 11909876543, 'mariana.lima@outlook.com'),
('Gustavo Ribeiro', 12345678901, 11908765432, 'gustavo.ribeiro@terra.com.br'),
('Luciana Martins', 23456789012, 11907654321, 'luciana.martins@gmail.com'),
('Joaquim Rocha', 34567890123, 11906543210, 'joaquim.rocha@yahoo.com.br'),
('Patricia Alves', 45678901234, 11905432109, 'patricia.alves@hotmail.com'),
('Renato Ferreira', 56789012345, 11904321098, 'renato.ferreira@outlook.com'),
('Cláudia Oliveira', 67890123456, 11903210987, 'claudia.oliveira@terra.com.br'),
('Eduardo Ribeiro', 78901234567, 11902109876, 'eduardo.ribeiro@gmail.com'),
('Sofia Pereira', 89012345678, 11901098765, 'sofia.pereira@yahoo.com.br'),
('Felipe Costa', 90123456789, 11899987654, 'felipe.costa@hotmail.com'),
('Camila Rocha', 12345678901, 11898876543, 'camila.rocha@outlook.com'),
('Rafael Santos', 23456789012, 11897765432, 'rafael.santos@terra.com.br');


-- Copiando dados para a tabela eventos.participante: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
