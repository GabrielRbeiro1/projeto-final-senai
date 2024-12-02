document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.getElementById('login-form');
    const responseMessage = document.getElementById('response-message');

    async function login(event) {
        event.preventDefault(); 

        const email_organizador = document.getElementById('email_organizador').value.trim()
        const senha_organizador = document.getElementById('senha_organizador').value.trim()

        try {
            const response = await fetch('http://localhost:3000/autenticar/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    email_organizador,
                    senha_organizador
                })
            });

            const data = await response.json();

            if (response.ok) {
                localStorage.setItem('token', data.token)
                window.location.href = './pages/EventosCadastrados.html';
            } else {
                responseMessage.textContent = data.error || 'Erro desconhecido';
            }
        } catch (error) {
           
            responseMessage.textContent = 'Erro ao tentar fazer login';
        }
    }

    loginForm.addEventListener('submit', login);


});
