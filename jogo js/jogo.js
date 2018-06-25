var document = document,
	time = 0,
	tempo = document.getElementById("txtTempo");

tempo.innerHTML = "Tempo: " + time + "s";
setTimeout(contarTempo,1000);

function contarTempo(){
	time = time + 1;
	tempo.innerHTML = "Tempo: " + time + "s";
	setTimeout(contarTempo,1000);
}

function novoJogo(){
	time = 0;
	tempo.innerHTML = "Tempo: " + time + "s";
}

function salvar(){
	localStorage.setItem("tempinho", time);
}

function carregar(){
	time = parseInt(localStorage.getItem("tempinho"));
	tempo.innerHTML = "Tempo: " + time + "s";
}