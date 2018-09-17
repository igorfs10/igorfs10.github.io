var espaco = ["", "", "", "", "", "", "", "", ""];
var jogo = "";
var jogando = false;
var jogador = "X";
var oponente = "O";
var cpu = "O";
var primeiroJogador = 0;
var id = 0;

// Zera todas as variaveis e atualiza o quadro para forçar um jogo novo
function resetar(){
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
	jogador = "X";
	oponente = "O";
	// Sorteia para ver se o computador vai ser X ou O
	primeiroJogador = Math.floor(Math.random() * (10 - 1 + 1)) + 1;
	if(primeiroJogador <= 5){
		cpu = jogador;
	}else{
		cpu = oponente;
	}
	limparQuadro();
}

// Verifica se alguma linha de X ou O foi feita ou se todos os espacos foram usados para definir o resultado da partida e impedir que alguém jogue
function verificarVencedor(){
    mostrarVencedor();
	if(document.getElementById("status").innerHTML === jogador + " ganhou" || document.getElementById("status").innerHTML === "Empate"){
		jogando = false;
	}
}

// Muda a variavel para a vez de quem vai jogar
function turno(){
	if(jogador === "X"){
		jogador = "O";
		oponente = "X";
	}else{
		jogador = "X";
		oponente = "O";
	}
}

// Sorteia um espaco, se sortear um espaco usado, sortea um novo
function sortearEspaco(){
	do{
		id = Math.floor(Math.random() * (8 - 0 + 1)) + 0;
	}while(espaco[id] === jogador || espaco[id] === oponente);
	return id;
}

// O computador joga de modo diferente dependendo do nivel
function vezCPU(){
	if(jogo === "facil"){
		// Somente sorteia onde o computador irá jogar
		jogar(sortearEspaco());
	}else if(jogo === "medio"){
		// Ele verifica se o oponente tem dois espacos proximos e coloca próximo para impedir que o oponente ganhe
		if((espaco[1] === oponente && espaco[2] === oponente && espaco[0] === "") || (espaco[4] === oponente && espaco[8] === oponente && espaco[0] === "") || (espaco[3] === oponente && espaco[6] === oponente && espaco[0] === "")){
			jogar(0);
		}else if((espaco[0] === oponente && espaco[2] === oponente && espaco[1] === "") || (espaco[4] === oponente && espaco[7] === oponente && espaco[1] === "")){
			jogar(1);
		}else if((espaco[0] === oponente && espaco[1] === oponente && espaco[2] === "") || (espaco[5] === oponente && espaco[8] === oponente && espaco[2] === "") || (espaco[4] === oponente && espaco[6] === oponente && espaco[2] === "")){
			jogar(2);
		}else if((espaco[0] === oponente && espaco[6] === oponente && espaco[3] === "") || (espaco[4] === oponente && espaco[5] === oponente && espaco[3] === "")){
			jogar(3);
		}else if((espaco[0] === oponente && espaco[8] === oponente && espaco[4] === "") || (espaco[2] === oponente && espaco[6] === oponente && espaco[4] === "") || (espaco[1] === oponente && espaco[7] === oponente && espaco[4] === "") || (espaco[3] === oponente && espaco[5] === oponente && espaco[4] === "")){
			jogar(4);
		}else if((espaco[3] === oponente && espaco[4] === oponente && espaco[5] === "") || (espaco[2] === oponente && espaco[8] === oponente && espaco[5] === "")){
			jogar(5);
		}else if((espaco[0] === oponente && espaco[3] === oponente && espaco[6] === "") || (espaco[4] === oponente && espaco[2] === oponente && espaco[6] === "") || (espaco[7] === oponente && espaco[8] === oponente && espaco[6] === "")){
			jogar(6);
		}else if((espaco[1] === oponente && espaco[4] === oponente && espaco[7] === "") || (espaco[6] === oponente && espaco[8] === oponente && espaco[7] === "")){
			jogar(7);
		}else if((espaco[0] === oponente && espaco[4] === oponente && espaco[8] === "") || (espaco[6] === oponente && espaco[7] === oponente && espaco[8] === "") || (espaco[2] === oponente && espaco[5] === oponente && espaco[8] === "")){
			jogar(8);
		}else{
			jogar(sortearEspaco());
		}
	}else if(jogo === "dificil"){
		// Verifica se tem dois espacos e marca no proximo para ganhar
		if((espaco[1] === jogador && espaco[2] === jogador && espaco[0] === "") || (espaco[4] === jogador && espaco[8] === jogador && espaco[0] === "") || (espaco[3] === jogador && espaco[6] === jogador && espaco[0] === "")){
			jogar(0);
		}else if((espaco[0] === jogador && espaco[2] === jogador && espaco[1] === "") || (espaco[4] === jogador && espaco[7] === jogador && espaco[1] === "")){
			jogar(1);
		}else if((espaco[0] === jogador && espaco[1] === jogador && espaco[2] === "") || (espaco[5] === jogador && espaco[8] === jogador && espaco[2] === "") || (espaco[4] === jogador && espaco[6] === jogador && espaco[2] === "")){
			jogar(2);
		}else if((espaco[0] === jogador && espaco[6] === jogador && espaco[3] === "") || (espaco[4] === jogador && espaco[5] === jogador && espaco[3] === "")){
			jogar(3);
		}else if((espaco[0] === jogador && espaco[8] === jogador && espaco[4] === "") || (espaco[2] === jogador && espaco[6] === jogador && espaco[4] === "") || (espaco[1] === jogador && espaco[7] === jogador && espaco[4] === "") || (espaco[3] === jogador && espaco[5] === jogador && espaco[4] === "")){
			jogar(4);
		}else if((espaco[3] === jogador && espaco[4] === jogador && espaco[5] === "") || (espaco[2] === jogador && espaco[8] === jogador && espaco[5] === "")){
			jogar(5);
		}else if((espaco[0] === jogador && espaco[3] === jogador && espaco[6] === "") || (espaco[4] === jogador && espaco[2] === jogador && espaco[6] === "") || (espaco[7] === jogador && espaco[8] === jogador && espaco[6] === "")){
			jogar(6);
		}else if((espaco[1] === jogador && espaco[4] === jogador && espaco[7] === "") || (espaco[6] === jogador && espaco[8] === jogador && espaco[7] === "")){
			jogar(7);
		}else if((espaco[0] === jogador && espaco[4] === jogador && espaco[8] === "") || (espaco[6] === jogador && espaco[7] === jogador && espaco[8] === "") || (espaco[2] === jogador && espaco[5] === jogador && espaco[8] === "")){
			jogar(8);
		// Verifica se o oponente tem dois espacos e impede ele de ganhar
		}else if((espaco[1] === oponente && espaco[2] === oponente && espaco[0] === "") || (espaco[4] === oponente && espaco[8] === oponente && espaco[0] === "") || (espaco[3] === oponente && espaco[6] === oponente && espaco[0] === "")){
			jogar(0);
		}else if((espaco[0] === oponente && espaco[2] === oponente && espaco[1] === "") || (espaco[4] === oponente && espaco[7] === oponente && espaco[1] === "")){
			jogar(1);
		}else if((espaco[0] === oponente && espaco[1] === oponente && espaco[2] === "") || (espaco[5] === oponente && espaco[8] === oponente && espaco[2] === "") || (espaco[4] === oponente && espaco[6] === oponente && espaco[2] === "")){
			jogar(2);
		}else if((espaco[0] === oponente && espaco[6] === oponente && espaco[3] === "") || (espaco[4] === oponente && espaco[5] === oponente && espaco[3] === "")){
			jogar(3);
		}else if((espaco[0] === oponente && espaco[8] === oponente && espaco[4] === "") || (espaco[2] === oponente && espaco[6] === oponente && espaco[4] === "") || (espaco[1] === oponente && espaco[7] === oponente && espaco[4] === "") || (espaco[3] === oponente && espaco[5] === oponente && espaco[4] === "")){
			jogar(4);
		}else if((espaco[3] === oponente && espaco[4] === oponente && espaco[5] === "") || (espaco[2] === oponente && espaco[8] === oponente && espaco[5] === "")){
			jogar(5);
		}else if((espaco[0] === oponente && espaco[3] === oponente && espaco[6] === "") || (espaco[4] === oponente && espaco[2] === oponente && espaco[6] === "") || (espaco[7] === oponente && espaco[8] === oponente && espaco[6] === "")){
			jogar(6);
		}else if((espaco[1] === oponente && espaco[4] === oponente && espaco[7] === "") || (espaco[6] === oponente && espaco[8] === oponente && espaco[7] === "")){
			jogar(7);
		}else if((espaco[0] === oponente && espaco[4] === oponente && espaco[8] === "") || (espaco[6] === oponente && espaco[7] === oponente && espaco[8] === "") || (espaco[2] === oponente && espaco[5] === oponente && espaco[8] === "")){
			jogar(8);
		// Tentar fechar o jogador se ele comecar
		}else if((espaco[0] === oponente || espaco[1] === oponente ||espaco[2] === oponente || espaco[3] === oponente ||espaco[5] === oponente ||espaco[6] === oponente || espaco[7] === oponente ||espaco[8] === oponente) && espaco[0]!=jogador && espaco[4] === ""){
			jogar(4);
		}else if(((espaco[1] === oponente && espaco[3] === oponente) || (espaco[1] === oponente && espaco[5] === oponente) || (espaco[3] === oponente && espaco[7] === oponente) || (espaco[5] === oponente && espaco[7] === oponente)) && espaco[4] === ""){
			jogar(4);
		}else if((espaco[1] === oponente || espaco[3] === oponente) && espaco[0] === ""){
			jogar(0);
		}else if((espaco[5] === oponente || espaco[7] === oponente) && espaco[8] === ""){
			jogar(8);
		}else if(espaco[1] === oponente && espaco[6] === oponente && espaco[4] === ""){
			jogar(4);
		}else if(espaco[4] === jogador && espaco[7] === ""){
			jogar(7);
		}else if(espaco[4] === jogador && espaco[1] === ""){
			jogar(1);
		// Se nao cair nos casos acima, continue jogando
		}else if(espaco[0] === ""){
			jogar(0);
		}else if(espaco[8] === ""){
			jogar(8);
		}else if(espaco[4] === ""){
			jogar(4);
		}else if(espaco[2] === ""){
			jogar(2);
		}else if(espaco[1] === ""){
			jogar(1);
		}else if(espaco[7] === ""){
			jogar(7);
		}else if(espaco[6] === ""){
			jogar(6);
		}else if(espaco[3] === ""){
			jogar(3);
		}else if(espaco[5] === ""){
			jogar(5);
		}
	}
}

// Botao para comecar o jogo
function botaoTipoDeJogo(tipoDeJogo){
	resetar();
	jogo = tipoDeJogo;
	jogando = true;
	vezJogador();
	// O computador comeca se for "X"
	if(cpu === jogador && (jogo === "facil" || jogo === "medio" || jogo === "dificil")){
		vezCPU();
	}
}

// Vai pegar o id do quadro que o jogador clicar
function jogar(id){
	if(jogando === true){
		// Verifica se o espaco clicado ja foi usado
		if(espaco[id] === ""){
			espaco[id] = jogador;
			mostrarNoQuadro(id);
			verificarVencedor();
			turno();
			if(jogando === true){
				vezJogador();
			}
			// O computador joga se estiver em uma partida contra a CPU
			if(jogando === true && jogador === cpu && (jogo === "facil" || jogo === "medio" || jogo === "dificil")){
				vezCPU();
			}
		}
	}else{
		vezJogador();
	}
}