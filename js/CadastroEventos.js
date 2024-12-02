const form = document.getElementById('event-form');
const responseMessage = document.getElementById('response-message');

async function submitEvent(event) {
  event.preventDefault();
  
 
  const nome_evento = document.getElementById('nome_evento').value;
  const data_evento = document.getElementById('data_evento').value;
  const local_evento = document.getElementById('local_evento').value;
  const descricao_evento = document.getElementById('descricao_evento').value;

 
  try {
    const response = await fetch('http://localhost:3000/cadastrar/evento', {
      method: 'POST',  
      headers: {
        'Content-Type': 'application/json',  
      },
      body: JSON.stringify({
        nome_evento,
        data_evento,
        local_evento,
        descricao_evento
      })
    });

    const data = await response.json();

    if (response.ok) {
      responseMessage.textContent = 'Evento cadastrado com sucesso!';
      responseMessage.style.color = 'green';
    } else {
      responseMessage.textContent = `Erro: ${data.error || 'Erro desconhecido'}`;
      responseMessage.style.color = 'red';
    }

    form.reset(); 
  } catch (error) {
    responseMessage.textContent = `Erro ao enviar os dados: ${error.message}`;
    responseMessage.style.color = 'red';
  }
}

form.addEventListener('submit', submitEvent);  
