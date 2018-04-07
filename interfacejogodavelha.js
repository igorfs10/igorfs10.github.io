function mostrarVencedor(){
	// Verifica se foi feito uma linha de X ou O para mostrar quem ganhou
	if((espaco[0] === jogador && espaco[3] === jogador && espaco[6] === jogador) || (espaco[1] === jogador && espaco[4] === jogador && espaco[7] === jogador) || (espaco[2] === jogador && espaco[5] === jogador && espaco[8] === jogador) || (espaco[0] === jogador && espaco[1] === jogador && espaco[2] === jogador) || (espaco[3] === jogador && espaco[4] === jogador && espaco[5] === jogador) || (espaco[6] === jogador && espaco[7] === jogador && espaco[8] === jogador) || (espaco[0] === jogador && espaco[4] === jogador && espaco[8] === jogador) || (espaco[2] === jogador && espaco[4] === jogador && espaco[6] === jogador)){
		document.getElementById("status").innerHTML = jogador + " ganhou";
		// Desativa o efeito de quadro selecionado
		for(id = 0;id <= 8; id++){
			document.getElementById(id).dataset.selecionado = "Desativado";
		}
	//Se todos os quadros forem usados e não tiver linha, marque como empate
	}else if (espaco[0] && espaco[1] && espaco[2] && espaco[3] && espaco[4] && espaco[5] && espaco[6] && espaco[7] && espaco[8]){
		document.getElementById("status").innerHTML = "Empate";
	}
}

// Mostra quem esta jogando
function vezJogador(){
	if (jogando===true){
			document.getElementById("status").innerHTML = "Jogador " + jogador;
	}else{
		document.getElementById("status").innerHTML = "Escolha o modo de jogo";
	}
}

function limparQuadro(){
	for(id = 0;id <= 8; id++){
		// Verifica as variaveis dos campos do jogo fazendo com que apareça nos campos
		document.getElementById(id).innerHTML = espaco[id];
		// Ativa o efeito de quadro selecionado
		document.getElementById(id).dataset.selecionado = jogador;
	}
}

function mostrarNoQuadro(id){
	// Escreve "X" ou "O" no espaco clicado
	document.getElementById(id).innerHTML = espaco[id];
	// Desabilita o efeito do quadro
	document.getElementById(id).dataset.selecionado = "Desativado";
	// Muda a cor do quadro dependendo de quem esta jogando
	for(id = 0;id <= 8; id++){
		if(document.getElementById(id).dataset.selecionado === jogador){
			document.getElementById(id).dataset.selecionado = oponente;
		}
	}
}