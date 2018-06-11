function getTanFromDegrees(degrees) {
  return Math.tan(degrees * Math.PI/180);
}

function mostrarCirculo(){
	forma = "Circulo";
	document.getElementById("calculos1").innerHTML = "<p id='texto'>Digite o raio:</p>";
	document.getElementById("calculos2").innerHTML = "<input type='number' id='raio' min='1' value='1'/><br>";
}
function mostrarQuadrilatero(){
	forma = "Quadrilatero";
	document.getElementById("calculos1").innerHTML = "<p id='texto'>Digite o lado:</p> <p id='texto'>Digite o lado:</p>";
	document.getElementById("calculos2").innerHTML = "<input type='number' id='lado1' min='1' value='1'/><br><input type='number' id='lado2' min='1' value='1'/><br>";
}

function mostrarTriangulo(){
	forma = "Triangulo";
	document.getElementById("calculos1").innerHTML = "<p id='texto'>Digite o lado:</p> <p id='texto'>Digite o lado:</p> <p id='texto'>Digite o lado:</p>";
	document.getElementById("calculos2").innerHTML = "<input type='number' id='lado1' min='1' value='1'/><br><input type='number' id='lado2' min='1' value='1'/><br><input type='number' id='lado3' min='1' value='1'/><br>";
}

function mostrarPoligono(){
	forma = "Poligono";
	document.getElementById("calculos1").innerHTML = "<p id='texto'>Digite a quantidade de lados:</p> <p id='texto'>Digite o lado:</p>";
	document.getElementById("calculos2").innerHTML = "<input type='number' id='quantidade' min='5' max='10' value='5'/><br><input type='number' id='lado1' min='1' value='1'/> <br>";
}

function colocarTabela(){
	if(forma === "Circulo"){
		r = parseInt(raio.value)
		area = Math.PI * Math.pow(r, 2);
		perimetro = 2 * Math.PI * r;
		nome = "Circulo";
	} else if (forma === "Triangulo"){
		l1 = parseInt(lado1.value);
		l2 = parseInt(lado2.value);
		l3 = parseInt(lado3.value);
		perimetro = l1 + l2 + l3;
		p = perimetro/2;
		area = Math.sqrt(p*(p-l1)*(p-l2)*(p-l3));
		if(lado1.value === lado2.value && lado1.value === lado1.value){
			nome = "Equilatero"
		} else if (lado1.value !== lado2.value && lado2.value !== lado3.value && lado1.value !== lado3.value) {
			nome = "Escaleno"
		} else {
			nome = "Isosceles";
		}
	} else if (forma === "Quadrilatero") {
		l1 = parseInt(lado1.value);
		l2 = parseInt(lado2.value);
		perimetro = l1 * 2 + l2 * 2;
		area = l1 * l2;
		if (l1 === l2){
			nome = "Quadrado";
		} else {
			nome = "Retangulo";
		}
	} else if (forma === "Poligono") {
		q = parseInt(quantidade.value);
		l1 = parseInt(lado1.value);
		perimetro = q * l1;
		area = (q * Math.pow(l1, 2) / (4 * getTanFromDegrees(180 / q)));
		if (q === 5){
			nome = "Pentagono";
		} else if (q === 6){
			nome = "Hexagono";
		} else if (q === 7){
			nome = "Heptagono";
		} else if (q === 8){
			nome = "Octogono";
		} else if (q === 9){
			nome = "Eneagono";
		} else {
			nome = "Decagono";
		}
	}
	
	var date = new Date();
	var row = tabela.insertRow();
	var celForma = row.insertCell(0);
	var cellArea = row.insertCell(1);
	var cellPerimetro = row.insertCell(2);
	var cellNome = row.insertCell(3);
	var cellData = row.insertCell(4);
	celForma.innerHTML = forma;
	cellArea.innerHTML = area;
	cellPerimetro.innerHTML = perimetro;
	cellNome.innerHTML = nome;
	cellData.innerHTML = date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
}