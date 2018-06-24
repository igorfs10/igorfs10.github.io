var document = document,
	moeda,
	resultado = document.getElementById("resultado"),
	acertos = 0,
	escolhaComputador;

function executar(){
	acertos = 0;
	for(i = 10; i > 0; i--){
		moeda = jogarMoeda();
		escolhaComputador = pegarEscolhaComputador();
		if (moeda === escolhaComputador){
			acertos = acertos + 1;
		}
		if (moeda === "coroa"){
			escolhaComputador = pegarEscolhaComputador();
			if (moeda === escolhaComputador){
				acertos = acertos + 1;
			}
		}
	}
	resultado.innerHTML = acertos;
}

function pegarEscolhaComputador(){
	if(document.getElementById("escolhaAleatoria").checked){
		var escolha = Math.floor(Math.random() * (2 - 1 + 1)) + 1;
		if (escolha == 1){
			return "cara";
		} else {
			return "coroa";
		}
	} else if (document.getElementById("escolhaCara").checked) {
		return document.getElementById("escolhaCara").value;
	} else if (document.getElementById("escolhaCoroa").checked) {
		return document.getElementById("escolhaCoroa").value;
	}
}

function jogarMoeda(){
	var jogaMoeda;
	jogaMoeda = Math.floor(Math.random() * (2 - 1 + 1)) + 1;
	if (jogaMoeda == 1){
		return "cara";
	} else {
		return "coroa";
	}
}