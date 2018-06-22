var document = document,
    tabela = document.getElementById("tabela"),
    nome = document.getElementById("nome"),
    plataforma = document.getElementById("plataforma");

function atualizar() {
    var i,
        celulaID,
        celulaApagar;
    
    for (i = 1; i <= tabela.rows.length - 1; i = i + 1) {
        celulaID = tabela.rows[i].cells[0];
        celulaID.innerHTML = i;
        celulaApagar = tabela.rows[i].cells[3];
        celulaApagar.id = i;
    }
}

function limpar(){
	var i = 1,
		linha;
	
	while (i < tabela.rows.length) {
		linha = tabela.rows.length - 1;
		tabela.deleteRow(linha);
	}
}

function apagar(id) {
    tabela.deleteRow(id);
    atualizar();
}

function adicionar() {
    var linha = tabela.insertRow(tabela.rows.length),
        celulaID = linha.insertCell(0),
        celulaNome = linha.insertCell(1),
        celulaPlataforma = linha.insertCell(2),
        celulaApagar = linha.insertCell(3);
    
    celulaID.innerHTML = tabela.rows.length - 1;
    celulaNome.innerHTML = nome.value;
    celulaPlataforma.innerHTML = plataforma.value;
    celulaApagar.innerHTML = "Apagar";
    celulaApagar.id = tabela.rows.length - 1;
    celulaApagar.onclick = function () { apagar(this.id); };
}