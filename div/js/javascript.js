var primeiro = 1,
	atual = 1,
	ultimo = 6;

function mudarVerde(){
	document.getElementById("caixa_menu").dataset.selecionado = "verde";
}

function mudarAzul(){
	document.getElementById("caixa_menu").dataset.selecionado = "azul";
}

function mudarAmarelo(){
	document.getElementById("caixa_menu").dataset.selecionado = "amarelo";
}

function mudarVermelho(){
	document.getElementById("caixa_menu").dataset.selecionado = "vermelho";
}

function anterior(){
	if (atual === primeiro) {
		atual = ultimo;
	} else {
		atual--;
	}
	document.getElementById("header").dataset.imagem = atual;
}

function proximo(){
	if (atual === ultimo) {
		atual = primeiro;
	} else {
		atual++;
	}
	document.getElementById("header").dataset.imagem = atual;
}