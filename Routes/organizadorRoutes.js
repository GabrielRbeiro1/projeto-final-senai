const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { body, validationResult } = require('express-validator');
const db = require('../database/database');
const router = express.Router();

// Função para gerar o token JWT
const generateToken = (id_organizador) => {
  const payload = { id_organizador };
  return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' });
};

// Rota para o cadastro do organizador
router.post('/cadastro', 
  [
    body('nome_organizador').notEmpty().withMessage('Nome é obrigatório'),
    body('email_organizador').isEmail().withMessage('Informe um e-mail válido'),
    body('senha_organizador').notEmpty().withMessage('A senha é obrigatória')
  ], 
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { nome_organizador, email_organizador, senha_organizador } = req.body;

    try {
     
      const [existingUser] = await db.query(
        'SELECT * FROM organizadores WHERE email_organizador = ?',
        [email_organizador]
      );

  
      if (existingUser.length > 0) {
        return res.status(400).json({ error: 'Este e-mail já está registrado' });
      }

     
      const hashedPassword = await bcrypt.hash(senha_organizador, 10);
    
      
      await db.query('INSERT INTO organizadores (nome_organizador, email_organizador, senha_organizador) VALUES (?, ?, ?)', 
      [nome_organizador, email_organizador, hashedPassword]);

      res.status(201).json({ message: 'Cadastro realizado com sucesso' });

    } catch (err) {
      res.status(500).json({ error: 'Erro ao cadastrar organizador' });
    }
  }
)


//Rota de login
router.post('/login', async (req, res) => {
  const { email_organizador, senha_organizador } = req.body;

 
  if (!email_organizador || !senha_organizador) {
    return res.status(400).json({ error: 'E-mail e senha são obrigatórios' });
  }

  try {

    const [user] = await db.query(
      'SELECT * FROM organizadores WHERE email_organizador = ?',
      [email_organizador]
    );

    if (user.length === 0) {
      return res.status(400).json({ error: 'Usuário não encontrado' });
    }


    const hashedPassword = user[0].senha_organizador;
 

    
    const validPassword = await bcrypt.compare(senha_organizador.trim(), hashedPassword);
   

    if (!validPassword) {
      return res.status(400).json({ error: 'Senha incorreta' });
    }

   
    const token = generateToken(user[0].id_organizadores);
    return res.status(200).json({ message: 'Login bem-sucedido', token });

  } catch (err) {
    
    res.status(500).json({ error: 'Erro ao fazer login' });
  }
});


module.exports = router;
