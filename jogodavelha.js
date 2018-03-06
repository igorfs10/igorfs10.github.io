var espaco = ["", "", "", "", "", "", "", "", "", ""]
resetar()

function resetar(){ //Zera todas as variaveis para forçar um jogo novo
	espaco[1] = ""
	espaco[2] = ""
	espaco[3] = ""
	espaco[4] = ""
	espaco[5] = ""
	espaco[6] = ""
	espaco[7] = ""
	espaco[8] = ""
	espaco[9] = ""
	jogo = ""
	jogando = false
	jogador = 0
	atualizarQuadro()
}

function verificarVencedor(){ // Verifica se alguma linha de X ou O foi feita ou se todos os espacos foram usados para definir o resultado da partida
	if(espaco[1]=="X" && espaco[4]=="X" && espaco[7]=="X" || espaco[2]=="X" && espaco[5]=="X" && espaco[8]=="X" || espaco[3]=="X" && espaco[6]=="X" && espaco[9]=="X" || espaco[1]=="X" && espaco[2]=="X" && espaco[3]=="X" || espaco[4]=="X" && espaco[5]=="X" && espaco[6]=="X" || espaco[7]=="X" && espaco[8]=="X" && espaco[9]=="X" || espaco[1]=="X" && espaco[5]=="X" && espaco[9]=="X" || espaco[3]=="X" && espaco[5]=="X" && espaco[7]=="X"){
		alert("Jogador X ganhou")
		resetar()
	}else if(espaco[1]=="O" && espaco[4]=="O" && espaco[7]=="O" || espaco[2]=="O" && espaco[5]=="O" && espaco[8]=="O" || espaco[3]=="O" && espaco[6]=="O" && espaco[9]=="O" || espaco[1]=="O" && espaco[2]=="O" && espaco[3]=="O" || espaco[4]=="O" && espaco[5]=="O" && espaco[6]=="O" || espaco[7]=="O" && espaco[8]=="O" && espaco[9]=="O" || espaco[1]=="O" && espaco[5]=="O" && espaco[9]=="O" || espaco[3]=="O" && espaco[5]=="O" && espaco[7]=="O"){
		alert("Jogador O ganhou")
		resetar()
	}else if (espaco[1] && espaco[2] && espaco[3] && espaco[4] && espaco[5] && espaco[6] && espaco[7] && espaco[8] && espaco[9]){
		alert("Empate")
		resetar()
	}
}

function turno(){ // Muda a variavel para ver quem vai jogar
	if (jogador == 0){
		jogador = 1
	}else{
		jogador = 0
	}
}


function atualizarQuadro(){ // Verifica as variaveis dos campos do jogo e faz com que apareça nos campos
	for(i = 1;i <= 9; i++){
		document.getElementById(i).innerHTML = espaco[i]
	}
}

function novoTurno(){ // Realiza os passos repetitivos sempre que alguem joga
	turno()
	atualizarQuadro()
	verificarVencedor()
}

function botaoJogador(){
	resetar()
	jogo = "jogador"
	jogando = true
	alert("Começou")
}

function botaoFacil(){
	resetar()
	jogo = "facil"
	jogando = true
	alert("Começou")
	CPU() // O Computador sempre começa o jogo
}

function botaoMedio(){
	resetar()
	jogo = "medio"
	jogando = true
	alert("Começou")
	CPU() // O Computador sempre começa o jogo
}
function botaoDificil(){
	resetar()
	jogo = "dificil"
	jogando = true
	alert("Começou")
	CPU() // O Computador sempre começa o jogo
}

function sortearCPU(){
	do {	// Sorteia outro número se o número sorteado ja estiver sendo usado
		id = Math.floor((Math.random() * 9) + 1)
	}while(espaco[id] == "X" || espaco[id] == "O")
	return id
}

function CPU(){ // O Computador só jogar se a variável jogo for facil, medio ou dificil
	if (jogo == "facil"){		// Somente sorteia onde o computador irá jogar
		botao(sortearCPU())
		
	}else if (jogo == "medio"){ // Ele verifica se o oponente tem dois espacos proximos e coloca "X" próximo para impedir que o oponente ganhe
		if(espaco[2]=="O" && espaco[3]=="O" && espaco[1]==""|| espaco[5]=="O" && espaco[9]=="O" && espaco[1]=="" || espaco[4]=="O" && espaco[7]=="O" && espaco[1]==""){
			botao(1)
		}else if(espaco[1]=="O" && espaco[3]=="O" && espaco[2]=="" || espaco[5]=="O" && espaco[8]=="O" && espaco[2]==""){
			botao(2)
		}else if(espaco[1]=="O" && espaco[2]=="O" && espaco[3]=="" || espaco[6]=="O" && espaco[9]=="O" && espaco[3]=="" || espaco[5]=="O" && espaco[7]=="O" && espaco[3]==""){
			botao(3)
		}else if(espaco[1]=="O" && espaco[7]=="O" && espaco[4]=="" || espaco[5]=="O" && espaco[6]=="O" && espaco[4]==""){
			botao(4)
		}else if(espaco[1]=="O" && espaco[9]=="O" && espaco[5]=="" || espaco[3]=="O" && espaco[7]=="O" && espaco[5]=="" || espaco[2]=="O" && espaco[8]=="O" && espaco[5]=="" || espaco[4]=="O" && espaco[6]=="O" && espaco[5]==""){
			botao(5)
		}else if(espaco[4]=="O" && espaco[5]=="O" && espaco[6]=="" || espaco[3]=="O" && espaco[9]=="O" && espaco[6]==""){
			botao(6)
		}else if(espaco[1]=="O" && espaco[4]=="O" && espaco[7]=="" || espaco[5]=="O" && espaco[3]=="O" && espaco[7]=="" || espaco[8]=="O" && espaco[9]=="O" && espaco[7]==""){
			botao(7)
		}else if(espaco[2]=="O" && espaco[5]=="O" && espaco[8]=="" || espaco[7]=="O" && espaco[9]=="O" && espaco[8]==""){
			botao(8)
		}else if(espaco[1]=="O" && espaco[5]=="O" && espaco[9]=="" || espaco[7]=="O" && espaco[8]=="O" && espaco[9]=="" || espaco[3]=="O" && espaco[6]=="O" && espaco[9]==""){
			botao(9)
		}else{
			botao(sortearCPU())
		}
		
	}else if (jogo == "dificil"){
		
	}
}

function botao(id){ // Vai pegar o id do quadro que o jogador clicar
	if (jogando==true){
		if(espaco[id] == ""){ // Verifica se o espaco clicado ja foi usado
			if(jogador == 0){ // Verifica quem está jogando e poe o simbolo certo
				espaco[id] = "X"
				document.getElementById(id).style.fontSize = "xx-large" // Fonte Grande
				novoTurno()
			}else{
				espaco[id] = "O"
				document.getElementById(id).style.fontSize = "xx-large" // Fonte Grande
				novoTurno()
				CPU() // O Computador joga se estiver em uma partida contra a CPU
			}
		}
	}else{
		alert("Escolha o modo de jogo")
	}
}