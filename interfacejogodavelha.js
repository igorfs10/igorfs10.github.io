// Verifica se alguma linha de X ou O foi feita ou se todos os espacos foram usados para mostrar quem venceu
function mostrarVencedor(){
	if((espaco[0] === jogador && espaco[3] === jogador && espaco[6] === jogador) || (espaco[1] === jogador && espaco[4] === jogador && espaco[7] === jogador) || (espaco[2] === jogador && espaco[5] === jogador && espaco[8] === jogador) || (espaco[0] === jogador && espaco[1] === jogador && espaco[2] === jogador) || (espaco[3] === jogador && espaco[4] === jogador && espaco[5] === jogador) || (espaco[6] === jogador && espaco[7] === jogador && espaco[8] === jogador) || (espaco[0] === jogador && espaco[4] === jogador && espaco[8] === jogador) || (espaco[2] === jogador && espaco[4] === jogador && espaco[6] === jogador)){
		document.getElementById("status").innerHTML = jogador + " ganhou";
	}else if (espaco[0] && espaco[1] && espaco[2] && espaco[3] && espaco[4] && espaco[5] && espaco[6] && espaco[7] && espaco[8]){
		document.getElementById("status").innerHTML = "Empate";
	}
}

// Mostra quem esta jogando
function vezJogador(){
	if (jogando===true){
			document.getElementById("status").innerHTML = "Jogador " + jogador;
	}else{
		document.getElementById("status").innerHTML = "Escolha o jogo";
	}
}

// Verifica as variaveis dos campos do jogo e faz com que apareça nos campos
function atualizarQuadro(){
	for(id = 0;id <= 8; id++){
		document.getElementById(id).innerHTML = espaco[id]; // Escreve o que esta na variavel no quadro
	}
}

// Escreve "X" ou "O" no espaco clicado
function mostrarNoQuadro(id){
	document.getElementById(id).innerHTML = espaco[id];
}