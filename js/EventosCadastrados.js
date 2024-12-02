document.addEventListener("DOMContentLoaded", () => {
    const eventList = document.getElementById("event-list");
    const modal = document.getElementById("event-modal");
    const closeModal = document.getElementById("close-modal");
    const modalNome = document.getElementById("modal-nome");
    const modalData = document.getElementById("modal-data");
    const modalLocal = document.getElementById("modal-local");
    const modalDescricao = document.getElementById("modal-descricao");
    const modalParticipantes = document.getElementById("modal-participantes");  // Agora há um lugar para exibir os participantes
    const modalQuantidade = document.getElementById("modal-quantidade");  // Quantidade de participantes
    const deleteButton = document.getElementById("delete-event");

    let currentEventId = null;

    async function fetchEvents() {
        try {
            const response = await fetch("http://localhost:3000/cadastrar/evento");
            const events = await response.json();

            eventList.innerHTML = ""; // Limpa a lista de eventos

            events.forEach(event => {
                const eventCard = document.createElement("div");
                eventCard.classList.add("event-card");
                eventCard.innerHTML = `
                    <h3>${event.nome_evento}</h3>
                    <p><span>Data:</span> ${new Date(event.data_evento).toLocaleDateString()}</p>
                    <p><span>Local:</span> ${event.local_evento}</p>
                    <p><span>Participantes:</span> ${event.participantes.length > 0 ? event.participantes.length : 'Nenhum participante'}</p>
                `;
                // Agora estamos passando a informação completa do evento ao clicar na card
                eventCard.addEventListener("click", () => showEventDetails(event));
                eventList.appendChild(eventCard);
            });
        } catch (error) {
            console.error("Erro ao buscar eventos:", error);
        }
    }

    function showEventDetails(event) {
        console.log("Mostrando detalhes para o evento:", event); // Adicionamos um log para ver o que está sendo passado
        modalNome.textContent = event.nome_evento;
        modalData.textContent = new Date(event.data_evento).toLocaleString();
        modalLocal.textContent = event.local_evento;
        modalDescricao.textContent = event.descricao_evento;

        currentEventId = event.evento_id;

        // Exibir os participantes
        const participantes = event.participantes || [];
        modalQuantidade.textContent = participantes.length;

        if (participantes.length > 0) {
            modalParticipantes.innerHTML = participantes.map(part => `
                <li>${part.nome_participante} (${part.email_participante}) - ${part.telefone_participante}</li>
            `).join(""); // Incluindo o número de telefone
        } else {
            modalParticipantes.innerHTML = "<li>Não há participantes neste evento</li>";
        }
        

        // Mostra o modal
        modal.style.display = "flex";
    }

    async function deleteEvent() {
        if (currentEventId === null) return;

        try {
            const response = await fetch(`http://localhost:3000/cadastrar/evento/${currentEventId}`, {
                method: "DELETE",
            });

            if (response.ok) {
                modal.style.display = "none"; 
                fetchEvents(); // Atualizar lista de eventos após exclusão
            } else {
                alert("Erro ao excluir evento.");
            }
        } catch (error) {
            console.error("Erro ao excluir evento:", error);
            alert("Erro ao excluir evento.");
        }
    }

    closeModal.addEventListener("click", () => {
        modal.style.display = "none";
    });

    window.addEventListener("click", (e) => {
        if (e.target === modal) {
            modal.style.display = "none";
        }
    });

    deleteButton.addEventListener("click", deleteEvent);

    fetchEvents(); // Carregar os eventos quando a página carregar
});
