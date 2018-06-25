var document = document,
	time = 0;
	tempo = document.getElementById("txtTempo");
contarTempo();

function contarTempo(){
	time = time + 1;
	tempo.innerHTML = "Tempo: " + time + "s";
	setTimeout(contarTempo,1000);
}