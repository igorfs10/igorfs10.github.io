document.getElementById("status").style.fontSize = "x-large";
for(id = 0;id <= 8; id++){
		document.getElementById(id).style.fontSize = "xx-large"; // Fonte Grande
}

function mostrarVencedor(){ // Verifica se alguma linha de X ou O foi feita ou se todos os espacos foram usados para definir o resultado da partida
	if((espaco[0]==="X" && espaco[3]==="X" && espaco[6]==="X") || (espaco[1]==="X" && espaco[4]==="X" && espaco[7]==="X") || (espaco[2]==="X" && espaco[5]==="X" && espaco[8]==="X") || (espaco[0]==="X" && espaco[1]==="X" && espaco[2]==="X") || (espaco[3]==="X" && espaco[4]==="X" && espaco[5]==="X") || (espaco[6]==="X" && espaco[7]==="X" && espaco[8]==="X") || (espaco[0]==="X" && espaco[4]==="X" && espaco[8]==="X") || (espaco[2]==="X" && espaco[4]==="X" && espaco[6]==="X")){
		document.getElementById("status").innerHTML = "X ganhou";
	}else if((espaco[0]==="O" && espaco[3]==="O" && espaco[6]==="O") || (espaco[1]==="O" && espaco[4]==="O" && espaco[7]==="O") || (espaco[2]==="O" && espaco[5]==="O" && espaco[8]==="O") || (espaco[0]==="O" && espaco[1]==="O" && espaco[2]==="O") || (espaco[3]==="O" && espaco[4]==="O" && espaco[5]==="O") || (espaco[6]==="O" && espaco[7]==="O" && espaco[8]==="O") || (espaco[0]==="O" && espaco[4]==="O" && espaco[8]==="O") || (espaco[2]==="O" && espaco[4]==="O" && espaco[6]==="O")){
		document.getElementById("status").innerHTML = "O ganhou";
	}else if (espaco[0] && espaco[1] && espaco[2] && espaco[3] && espaco[4] && espaco[5] && espaco[6] && espaco[7] && espaco[8]){
		document.getElementById("status").innerHTML = "Empate";
	}
}

function vezJogador(){
	if (jogando===true){
		if(jogador===1){
			document.getElementById("status").innerHTML = "Jogador O";
		}else{
			document.getElementById("status").innerHTML = "Jogador X";
		}
	}else{
		document.getElementById("status").innerHTML = "Escolha o modo de jogo";
	}
}

function atualizarQuadro(){ // Verifica as variaveis dos campos do jogo e faz com que apareça nos campos
	for(id = 0;id <= 8; id++){
		document.getElementById(id).innerHTML = espaco[id]; // Escreve o que esta na variavel no quadro
	}
}