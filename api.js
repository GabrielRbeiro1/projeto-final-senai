const dotenv = require('dotenv');
dotenv.config();  // Carregar variáveis de ambiente

const express = require('express');
const cors = require('cors');
const eventoRoutes = require('./Routes/eventoRoutes');  
const organizadorRoutes = require('./Routes/organizadorRoutes');  

const app = express();

app.use(cors());
app.use(express.json());



app.use('/cadastrar', eventoRoutes);  

app.use('/autenticar', organizadorRoutes);  
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
