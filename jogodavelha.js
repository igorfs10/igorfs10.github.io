var espaco = ["", "", "", "", "", "", "", "", ""];
var jogo = "";
var jogando = false;
var jogador = 0;
var id = 0;

function resetar(){ //Zera todas as variaveis para forçar um jogo novo
	espaco[0] = "";
	espaco[1] = "";
	espaco[2] = "";
	espaco[3] = "";
	espaco[4] = "";
	espaco[5] = "";
	espaco[6] = "";
	espaco[7] = "";
	espaco[8] = "";
	jogo = "";
	jogando = false;
	jogador = 0;
	atualizarQuadro();
}

function verificarVencedor(){ // Verifica se alguma linha de X ou O foi feita ou se todos os espacos foram usados para definir o resultado da partida
	if((espaco[0]==="X" && espaco[3]==="X" && espaco[6]==="X") || (espaco[1]==="X" && espaco[4]==="X" && espaco[7]==="X") || (espaco[2]==="X" && espaco[5]==="X" && espaco[8]==="X") || (espaco[0]==="X" && espaco[1]==="X" && espaco[2]==="X") || (espaco[3]==="X" && espaco[4]==="X" && espaco[5]==="X") || (espaco[6]==="X" && espaco[7]==="X" && espaco[8]==="X") || (espaco[0]==="X" && espaco[4]==="X" && espaco[8]==="X") || (espaco[2]==="X" && espaco[4]==="X" && espaco[6]==="X")){
		document.getElementById("status").innerHTML = "X ganhou";
		document.getElementById("status").style.fontSize = "xx-large";
		jogando = false;
	}else if((espaco[0]==="O" && espaco[3]==="O" && espaco[6]==="O") || (espaco[1]==="O" && espaco[4]==="O" && espaco[7]==="O") || (espaco[2]==="O" && espaco[5]==="O" && espaco[8]==="O") || (espaco[0]==="O" && espaco[1]==="O" && espaco[2]==="O") || (espaco[3]==="O" && espaco[4]==="O" && espaco[5]==="O") || (espaco[6]==="O" && espaco[7]==="O" && espaco[8]==="O") || (espaco[0]==="O" && espaco[4]==="O" && espaco[8]==="O") || (espaco[2]==="O" && espaco[4]==="O" && espaco[6]==="O")){
		document.getElementById("status").innerHTML = "O ganhou";
		document.getElementById("status").style.fontSize = "xx-large";
		jogando = false;
	}else if (espaco[0] && espaco[1] && espaco[2] && espaco[3] && espaco[4] && espaco[5] && espaco[6] && espaco[7] && espaco[8]){
		document.getElementById("status").innerHTML = "Empate";
		document.getElementById("status").style.fontSize = "xx-large";
		jogando = false;
	}
}

function turno(){ // Muda a variavel para ver quem vai jogar
	if (jogador === 0){
		jogador = 1;
	}else{
		jogador = 0;
	}
}


function atualizarQuadro(){ // Verifica as variaveis dos campos do jogo e faz com que apareça nos campos
	for(id = 0;id <= 8; id++){
		document.getElementById(id).innerHTML = espaco[id];
	}
}

function novoTurno(){ // Realiza os passos repetitivos sempre que alguem joga
	turno();
	atualizarQuadro();
	verificarVencedor();
}

function botaoJogador(){
	resetar();
	jogo = "jogador";
	jogando = true;
	document.getElementById("status").innerHTML = "Jogador X";
	document.getElementById("status").style.fontSize = "xx-large";
}

function botaoFacil(){
	resetar();
	jogo = "facil";
	jogando = true;
	document.getElementById("status").innerHTML = "Jogador X";
	document.getElementById("status").style.fontSize = "xx-large";
	CPU(); // O Computador sempre começa o jogo
}

function botaoMedio(){
	resetar();
	jogo = "medio";
	jogando = true;
	document.getElementById("status").innerHTML = "Jogador X";
	document.getElementById("status").style.fontSize = "xx-large";
	CPU(); // O Computador sempre começa o jogo
}
function botaoDificil(){
	resetar();
	jogo = "dificil";
	jogando = true;
	document.getElementById("status").innerHTML = "Jogador X";
	document.getElementById("status").style.fontSize = "xx-large";
	CPU(); // O Computador sempre começa o jogo
}

function sortearCPU(){
	do {	// Sorteia outro número se o número sorteado ja estiver sendo usado
		id = Math.floor((Math.random() * 9) + 1) - 1;
	}while(espaco[id] === "X" || espaco[id] === "O")
	return id;
}

function CPU(){ // O Computador só jogar se a variável jogo for facil, medio ou dificil
	if (jogo === "facil"){		// Somente sorteia onde o computador irá jogar
		botao(sortearCPU());
		
	}else if (jogo === "medio"){ // Ele verifica se o oponente tem dois espacos proximos e coloca "X" próximo para impedir que o oponente ganhe
		if((espaco[1]==="O" && espaco[2]==="O" && espaco[0]==="") || (espaco[4]==="O" && espaco[8]==="O" && espaco[0]==="") || (espaco[3]==="O" && espaco[6]==="O" && espaco[0]==="")){
			botao(0);
		}else if((espaco[0]==="O" && espaco[2]==="O" && espaco[1]==="") || (espaco[4]==="O" && espaco[7]==="O" && espaco[1]==="")){
			botao(1);
		}else if((espaco[0]==="O" && espaco[1]==="O" && espaco[2]==="") || (espaco[5]==="O" && espaco[8]==="O" && espaco[2]==="") || (espaco[4]==="O" && espaco[6]==="O" && espaco[2]==="")){
			botao(2);
		}else if((espaco[0]==="O" && espaco[6]==="O" && espaco[3]==="") || (espaco[4]==="O" && espaco[5]==="O" && espaco[3]==="")){
			botao(3);
		}else if((espaco[0]==="O" && espaco[8]==="O" && espaco[4]==="") || (espaco[2]==="O" && espaco[6]==="O" && espaco[4]==="") || (espaco[1]==="O" && espaco[7]==="O" && espaco[4]==="") || (espaco[3]==="O" && espaco[5]==="O" && espaco[4]==="")){
			botao(4);
		}else if((espaco[3]==="O" && espaco[4]==="O" && espaco[5]==="") || (espaco[2]==="O" && espaco[8]==="O" && espaco[5]==="")){
			botao(5);
		}else if((espaco[0]==="O" && espaco[3]==="O" && espaco[6]==="") || (espaco[4]==="O" && espaco[2]==="O" && espaco[6]==="") || (espaco[7]==="O" && espaco[8]==="O" && espaco[6]==="")){
			botao(6);
		}else if((espaco[1]==="O" && espaco[4]==="O" && espaco[7]==="") || (espaco[6]==="O" && espaco[8]==="O" && espaco[7]==="")){
			botao(7);
		}else if((espaco[0]==="O" && espaco[4]==="O" && espaco[8]==="") || (espaco[6]==="O" && espaco[7]==="O" && espaco[8]==="") || (espaco[2]==="O" && espaco[5]==="O" && espaco[8]==="")){
			botao(8);
		}else{
			botao(sortearCPU());
		}
		
	}else if (jogo === "dificil"){
		
	}
}

function botao(id){ // Vai pegar o id do quadro que o jogador clicar
	if (jogando === true){
		if(espaco[id] === ""){ // Verifica se o espaco clicado ja foi usado
			if(jogador === 0){ // Verifica quem está jogando e poe o simbolo certo
				espaco[id] = "X";
				document.getElementById(id).style.fontSize = "xx-large"; // Fonte Grande
				document.getElementById("status").innerHTML = "Jogador O";
				document.getElementById("status").style.fontSize = "xx-large";
				novoTurno();
			}else{
				espaco[id] = "O";
				document.getElementById(id).style.fontSize = "xx-large"; // Fonte Grande
				document.getElementById("status").innerHTML = "Jogador X";
				document.getElementById("status").style.fontSize = "xx-large";
				novoTurno();
				if(jogando === true){
					CPU(); // O Computador joga se estiver em uma partida contra a CPU
				}
			}
		}
	}else{
		document.getElementById("status").innerHTML = "Escolha o modo de jogo";
		document.getElementById("status").style.fontSize = "x-large";
	}
}