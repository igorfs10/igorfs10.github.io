var primeiro = 1,
	atual = 1,
	ultimo = 6;

timer();

function timer() { 
proximo();
setTimeout(timer, 5000); 
} 

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

function guitarra(){
	document.getElementById("header").dataset.imagem = "1";
}

function baixo(){
	document.getElementById("header").dataset.imagem = "2";
}

function bateria(){
	document.getElementById("header").dataset.imagem = "3";
}

function microfone(){
	document.getElementById("header").dataset.imagem = "6";
}

function violino(){
	document.getElementById("header").dataset.imagem = "5";
}

function teclado(){
	document.getElementById("header").dataset.imagem = "4";
}
