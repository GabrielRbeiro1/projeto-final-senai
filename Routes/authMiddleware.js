const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', ''); // Retira o "Bearer" do token

  if (!token) {
    return res.status(401).json({ error: 'Acesso negado, token não encontrado' });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;  // Salva os dados do organizador no req.user
    next();  // Chama a próxima função (continua o fluxo)
  } catch (err) {
    res.status(401).json({ error: 'Token inválido' });
  }
};

module.exports = authenticateToken;
