document.getElementById('cadastro-form').addEventListener('submit', async function(e) {
    e.preventDefault();  // Previne o comportamento padrão do formulário (não recarregar a página)
    
    // Captura os dados do formulário
    const nome_organizador = document.getElementById('nome_organizador').value;
    const email_organizador = document.getElementById('email_organizador').value;
    const senha_organizador = document.getElementById('senha_organizador').value;

    // Verifica se todos os campos foram preenchidos
    if (!nome_organizador || !email_organizador || !senha_organizador) {
        document.getElementById('responseMessage').textContent = 'Por favor, preencha todos os campos!';
        document.getElementById('responseMessage').style.color = 'red';
        return;
    }

    try {
        // Envia os dados do formulário para a rota de cadastro da API
        const response = await fetch('http://localhost:3000/autenticar/cadastro', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                nome_organizador: nome_organizador,
                email_organizador: email_organizador,
                senha_organizador: senha_organizador
            })
        });

        // Processa a resposta da API
        const result = await response.json();
        
        // Se o cadastro foi bem-sucedido
        if (response.status === 201) {
            document.getElementById('responseMessage').textContent = 'Cadastro realizado com sucesso';
            document.getElementById('responseMessage').style.color = 'green';
            document.getElementById('cadastro-form').reset();
        } else {
            document.getElementById('responseMessage').textContent = `Erro: ${result.error}`;  // Caso ocorra algum erro
            document.getElementById('responseMessage').style.color = 'red';
        }
    } catch (err) {
        document.getElementById('responseMessage').textContent = 'Erro ao cadastrar';
        document.getElementById('responseMessage').style.color = 'red';
    }
});
