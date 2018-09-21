--mysqldump --help | more														windows mostra a ajuda aos poucos
--mysqldump -u root -p db_biblioteca_inf3m > dbinf3m.sql						windows cria backup do banco


--mysql -u root -p
--bcd127

--quit;																			sai do mysql
--CREATE DATABASE dbcontatos2018inf3m											cria banco de dados
--SHOW DATABASES																mostra os bancos de dados
--SHOW TABLES																	mostra as tabelas do banco selecionado
--DROP TABLE tbl_editora 														deleta uma tabela
--USE tabela																	usar a tabela escrita

--SELECT FROM tbl_contato WHERE id = 1;											mostra o contato com id 1
--SELECT Host, User, Password FROM user;										mostra as entradas da tabela só com as colunas escolhidas
--SELECT * FROM employees LIMIT 10;												mostra os 10 primeiros cadastros
--SELECT * FROM salaries WHERE emp_no = 10001;									mostra os registros que o numero do empregado seja 10001
--SELECT * FROM titles WHERE emp_no = 10001;
--SELECT * FROM salaries ORDER BY salary DESC LIMIT 1;							mostra o maior valor de salario
--SELECT * FROM salaries ORDER BY salary ASC LIMIT 1;							mostra o menor valor de salario
--SELECT autor.nome, livro.titulo FROM autor, livro WHERE autor.id = livro.idAutor;			mostra os resultados comparando os campos de id autor
--SELECT a.nome, l.titulo FROM autor AS a, livro AS l WHERE a.id = l.idAutor;				mostra o resultado comparando dois campos e usando apelido para substituir o nome da tabela
--SELECT e.emp_no, e.first_name, e.last_name, t.title FROM employees AS e, titles AS t WHERE e.emp_no = t.emp_no AND t.to_date='9999-01-01' ORDER BY e.first_name LIMIT 100;



--SELECT * FROM table															mostra os dados da tabela
-- DESC tbl_editora																descrição da tabela
-- ALTER TABLE tbl_editora MODIFY COLUMN telefone VARCHAR(20) NOT NULL; 		altera o tipo do campo
-- ALTER TABLE tbl_editora ADD COLUMN celular VARCHAR(20) NULL;					adiciona campo na tabela
-- ALTER TABLE tbl_editora DROP COLUMN celular;									deleta o campo na tabela
-- ALTER TABLE tbl_editora ADD COLUMN celular VARCHAR(20) NULL AFTER telefone;	adiciona um campo depois de outro campo
-- ALTER TABLE tbl_editora ADD COLUMN celular VARCHAR(20) NULL FIRST;			adiciona um campo no começo da tabela

-- CREATE USER programador@localhost IDENTIFIED BY '1234';						adiciona usuário que só pode usar do localhost
-- CREATE USER programador@% IDENTIFIED BY '1234';								adiciona usuário que pode ser acessado de qualquer lugar
-- GRANT ALL PRIVILEGES ON db_biblioteca_inf3m.* TO programador@localhost IDENTIFIED BY '1234';		da permissão à todas as aões do banco escolhido ao usuário
-- REVOKE ALL PRIVILEGES ON db_biblioteca_inf3m.* FROM programador@localhost;						revoga as permissão do usuário
-- GRANT SELECT ON db_biblioteca_inf3m.tbl_cliente TO programador@localhost IDENTIFIED BY '1234'; 	da permissão de select somente na tabela cliente no banco livraria para o usuario

--INSERT INTO tbl_cliente VALUES('11','joao')									adiciona entrada no banco caso não tenha campo auto incrementado

--source caminho do arquivo.sql;												restaura backup do banco de dados


	--SELECT
--SELECT tbl_livro.titulo, tbl_livro.cnpjEditora, tbl_editora.cnpjEditora, tbl_editora.razaoSocial, tbl_editora.telefone
--FROM tbl_livro, tbl_editora
--WHERE tbl_editora.cnpjEditora = tbl_livro.cnpjEditora;

--SELECT l.isbn, l.titulo, e.razaoSocial, e.telefone, a.nome
--FROM tbl_livro AS l, tbl_editora AS e, tbl_autor AS a, tbl_livro_autor AS la
--WHERE e.cnpjEditora = l.cnpjEditora AND l.isbn = la.isbn AND la.idAutor = a.idAutor
--ORDER BY l.isbn;


--SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS nome FROM employees AS e LIMIT 100; Select concatenando e colocando apelido no campo
--SELECT e.emp_no, CONCAT_WS(' ', e.first_name, e.last_name) AS nome FROM employees AS e LIMIT 100; Select concatenando sempre usando o primeiro argumento como separação

CREATE VIEW funcionarios_por_departamento AS 					--Cria uma view baseado nesse select
	SELECT e.emp_no,
		CONCAT_WS(' ', e.first_name, e.last_name) AS nome,
		de.dept_no,
		d.dept_name
		FROM employees AS e,
		dept_emp AS de,
		departments AS d
		WHERE e.emp_no = de.emp_no
		AND d.dept_no = de.dept_no
		AND de.to_date = '9999-01-01'
;
SELECT * FROM funcionarios_por_departamento;					--Da um select na view



SELECT e.emp_no AS Cadastro,
		CONCAT_WS(' ', e.first_name, e.last_name) AS Nome_do_Funcionario,
		d.dept_name AS Nome_do_Departamento,
		s.salary
FROM employees AS e,
		dept_emp AS de,
		departments AS d,
		dept_manager AS dm,
		salaries AS s
WHERE e.emp_no = de.emp_no
		AND dm.emp_no = de.emp_no
		AND s.emp_no = de.emp_no
		AND d.dept_no = de.dept_no
		AND s.to_date = '9999-01-01';
		
		
SELECT e.emp_no AS Cadastro,
		CONCAT_WS(' ', e.first_name, e.last_name) AS Nome_do_Funcionario,
		d.dept_name AS Nome_do_Departamento,
		t.title AS Cargo,
		s.salary AS Salario
FROM employees AS e,
		dept_emp AS de,
		departments AS d,
		salaries AS s,
		titles AS t
WHERE e.emp_no = de.emp_no
		AND t.emp_no = e.emp_no
		AND s.emp_no = de.emp_no
		AND d.dept_no = de.dept_no
		AND t.to_date = '9999-01-01'
		AND s.to_date = '9999-01-01'
		AND de.to_date = '9999-01-01'
ORDER BY e.first_name, e.last_name
LIMIT 10;

SELECT e.emp_no,
	CONCAT_WS(' ', e.first_name, e.last_name) AS nome,
    de.dept_no,
    d.dept_name
    FROM employees AS e,
    dept_emp AS de,
    departments AS d
    WHERE e.emp_no = de.emp_no
    AND d.dept_no = de.dept_no
    AND de.to_date = '9999-01-01'
    ORDER by nome LIMIT 100;


CREATE TABLE tbl_editora (
	cnpjEditora VARCHAR(14) NOT NULL PRIMARY KEY,
	razaoSocial VARCHAR(100) NOT NULL,
	nomeFantasia VARCHAR(100) NOT NULL,
	logradouro VARCHAR(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	uf VARCHAR(2) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	email VARCHAR(100) NULL
);

CREATE TABLE tbl_autor (
	idAutor INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	dataNascimento DATE NULL,
	dataFalescimento DATE NULL,
	cidadeNascimento VARCHAR(100) NULL,
	resumoBiografia TEXT NULL,
	PRIMARY KEY (idAutor) -- Outra forma de definir primary key
);

CREATE TABLE tbl_categoria (
	idCategoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE tbl_cliente (
	cpfCliente VARCHAR(11) NOT NULL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NULL,
	telefone VARCHAR(20) NOT NULL,
	logradouro VARCHAR(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	uf VARCHAR(2) NOT NULL,
	cep VARCHAR(8) NOT NULL
);

CREATE TABLE tbl_funcionario (
	cpfFuncionario VARCHAR(11) NOT NULL PRIMARY KEY,
	matricula INT NOT NULL AUTO_INCREMENT UNIQUE,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NULL,
	telefone VARCHAR(20) NOT NULL,
	dataAdmissao DATE NOT NULL,
	dataDemissao DATE NULL,
	logradouro VARCHAR(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	uf VARCHAR(2) NOT NULL,
	cep VARCHAR(8) NOT NULL
);

CREATE TABLE tbl_livro(
	isbn VARCHAR(20) NOT NULL PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	largura DECIMAL(4,2) NOT NULL,
	profundidade DECIMAL(4,2) NOT NULL,
	altura DECIMAL(4,2) NOT NULL,
	numeroPagina INT NOT NULL,
	anoPublicacao YEAR NOT NULL,
	edicao VARCHAR(2) NOT NULL,
	volume VARCHAR(2) NULL,
	cnpjEditora VARCHAR(14) NOT NULL,
	FOREIGN KEY (cnpjEditora) REFERENCES tbl_editora (cnpjEditora)
);

CREATE TABLE tbl_livro_categoria(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idCategoria INT NOT NULL,
	isbn VARCHAR(20) NOT NULL,
	FOREIGN KEY (idCategoria) REFERENCES tbl_categoria (idCategoria),
	FOREIGN KEY (isbn) REFERENCES tbl_livro (isbn)
);

CREATE TABLE tbl_livro_autor(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idAutor INT NOT NULL,
	isbn VARCHAR(20) NOT NULL,
	FOREIGN KEY (isbn) REFERENCES tbl_livro (isbn),
	FOREIGN KEY (idAutor) REFERENCES tbl_autor (idAutor)
);

CREATE TABLE tbl_pedido(
	numeroPedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dataPedido DATE NOT NULL,
	cpfCliente VARCHAR(11) NOT NULL,
	cpfFuncionario VARCHAR(11) NOT NULL,
	tipoPedido CHAR(1) NOT NULL,
	FOREIGN KEY (cpfCliente) REFERENCES tbl_cliente (cpfCliente),
	FOREIGN KEY (cpfFuncionario) REFERENCES tbl_funcionario (cpfFuncionario)
);

CREATE TABLE tbl_itens_pedido(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantidade INT NOT NULL,
	valorItem DECIMAL(8,2) NOT NULL,
	valorDesconto DECIMAL(8,2) NULL,
	isbn VARCHAR(20) NOT NULL,
	numeroPedido INT NOT NULL,
	FOREIGN KEY (isbn) REFERENCES tbl_livro (isbn),
	FOREIGN KEY (numeroPedido) REFERENCES tbl_pedido (numeroPedido)
);



INSERT INTO tbl_cliente (cpfCliente, nome, email, telefone, logradouro, bairro, cidade, uf, cep)
VALUES ('12345678977', 'Igor', 'igor@igor.igor', '1234-5678', 'Rua Soeiro', 'Vila Rica', 'Itapava', 'SP', '12345678');

INSERT INTO tbl_funcionario(cpfFuncionario, nome, email, telefone, dataAdmissao, logradouro, bairro, cidade, uf, cep)
VALUES ('99999999999', 'Lauro', 'laurinho@email.com', '987654321', '2015-04-20', 'Rua Liminha', 'Vila Soeiro', 'Rio De Janeiro', 'SP', '11111111');

INSERT INTO tbl_pedido (dataPedido, cpfCliente, cpfFuncionario, tipoPedido)
VALUES('2018-08-24', '12345678977', '99999999999', 'E');

SELECT * from tbl_cliente;

SELECT * from tbl_pedido WHERE cpfCliente = '12345678977';


create table livro(
id int not null auto_increment primary key,
titulo varchar(100),
idAutor int not null,
foreign key (idAutor) REFERENCES autor(id)
);

INSERT INTO autor (nome)
VALUES('Celso');

INSERT INTO livro (titulo, idAutor)
VALUES('Dom Casmurro', 2);

SELECT e.first_name, e.last_name, t.title FROM employees AS e, titles AS t WHERE e.emp_no = t.emp_no LIMIT 100;


-- Marcel
CREATE TABLE tblcontatos (
	codigo INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL,
	email VARCHAR(100) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	celular VARCHAR(11) NOT NULL,
	data_nascimento DATE NOT NULL,
	obs TEXT
);

CREATE TABLE tbl_contatos (
)