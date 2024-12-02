const express = require('express');
const router = express.Router();
const db = require('../database/database');

// Criar evento
router.post('/evento', async (req, res) => {
  const { nome_evento, data_evento, local_evento, descricao_evento } = req.body;

  if (!nome_evento || !data_evento || !local_evento || !descricao_evento) {
    return res.status(400).json({ error: 'Todos os campos são obrigatórios' });
  }

  const query = 'INSERT INTO evento (nome_evento, data_evento, local_evento, descricao_evento) VALUES (?, ?, ?, ?)';

  try {
    const [result] = await db.query(query, [nome_evento, data_evento, local_evento, descricao_evento]);
    res.status(201).json({ message: 'Evento criado com sucesso!', eventoId: result.insertId });
  } catch (err) {
    console.error('Erro ao criar evento:', err);
    res.status(500).json({ error: 'Erro ao criar evento' });
  }
});

// Buscar eventos com participantes
router.get('/evento', async (req, res) => {
  const queryEventos = 'SELECT * FROM evento';
  const queryParticipantes = `
    SELECT 
      ep.evento_id,
      p.participante_id,
      p.nome_participante,
      p.cpf_participante,
      p.telefone_participante,
      p.email_participante
    FROM eventos_participantes ep
    JOIN participante p ON ep.participante_id = p.participante_id
  `;

  try {
    const [eventos] = await db.query(queryEventos); // Buscar eventos
    const [participantes] = await db.query(queryParticipantes); // Buscar participantes

    // Associar participantes aos eventos
    const eventosComParticipantes = eventos.map(evento => ({
      ...evento,
      participantes: participantes.filter(part => part.evento_id === evento.evento_id),
    }));

    res.status(200).json(eventosComParticipantes);
  } catch (err) {
    console.error('Erro ao buscar eventos e participantes:', err);
    res.status(500).json({ error: 'Erro ao buscar eventos e participantes' });
  }
});

// Buscar participantes de um evento específico
router.get('/evento/:evento_id/participantes', async (req, res) => {
  const { evento_id } = req.params;

  const query = `
    SELECT 
      ep.evento_id,
      p.participante_id,
      p.nome_participante,
      p.cpf_participante,
      p.telefone_participante,
      p.email_participante
    FROM eventos_participantes ep
    JOIN participante p ON ep.participante_id = p.participante_id
    WHERE ep.evento_id = ?
  `;

  try {
    const [results] = await db.query(query, [evento_id]);

    if (results.length === 0) {
      return res.status(404).json({ error: 'Nenhum participante encontrado para este evento.' });
    }

    res.status(200).json(results);
  } catch (err) {
    console.error('Erro ao buscar participantes:', err);
    res.status(500).json({ error: 'Erro ao buscar participantes' });
  }
});

// Excluir evento
router.delete('/evento/:evento_id', async (req, res) => {
  const { evento_id } = req.params;

  const query = 'DELETE FROM evento WHERE evento_id = ?';

  try {
    const [result] = await db.query(query, [evento_id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Evento não encontrado' });
    }

    res.status(200).json({ message: 'Evento excluído com sucesso!' });
  } catch (err) {
    console.error('Erro ao excluir evento:', err);
    res.status(500).json({ error: 'Erro ao excluir evento' });
  }
});

module.exports = router;
