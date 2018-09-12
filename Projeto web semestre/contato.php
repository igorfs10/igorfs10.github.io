<!doctype html>
<?php
    include "db.php";

    if(isset($_POST["btnEnviar"])){
        $nome = $_POST["txtNome"];
        $telefone = $_POST["txtTelefone"];
        $celular = $_POST["txtCelular"];
        $email = $_POST["txtEmail"];
        $homepage = $_POST["txtHomepage"];
        $facebook = $_POST["txtFacebook"];
        $sugestao = $_POST["txtSugestao"];
        $informacao = $_POST["txtInformacao"];
        $sexo = $_POST["sexo"];
        $profissao = $_POST["txtProfissao"];
        
        insertBanco($nome, $telefone, $celular, $email, $homepage, $facebook, $sugestao, $informacao, $sexo, $profissao);
    }
?>
<html lang="pt-br">
	<head>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
		<meta charset="UTF-8">
		<title>
            Banca de Jornal Bugs Bunny
		</title>
	</head>
	<body>
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="jquery/jquery-migrate-1.4.1.min.js"></script>
        <header id="cabecalho">
            <div id="logo"><a href="index.php"><img src="imagens/logo.png" alt="Banca Bugs Bunny"></a></div>
            <nav id="menu">
                <ul>
                    <li>
                        <a href="noticias.php">Notícias</a>
                    </li>
                    <li>
                        <a href="promocoes.php">Promoções</a>
                    </li>
                    <li>
                        <a href="bancas.php">Bancas</a>
                    </li>
                    <li>
                        <a href="sobre.php">Sobre</a>
                    </li>
                    <li>
                        <a href="contato.php">Contato</a>
                    </li>
                    <li>
                        <a href="celebridades.php">Celebridades</a>
                    </li>
                </ul>
            </nav>
            <div id="login">
                <div id="txtLogin">
                    Usuário:<br>
                    Senha:
                </div>
                <div id="caixaLogin">
                    <input type="text" id="entrar"><br>
                    <input type="password" id="senha"><br>
                </div>
                <div id="botaoLogin">
                    <input type="button" value="Entrar" onclick="logar()">
                </div>
            </div>
        </header>
        <div id="caixaEspecial"></div>
        <div id="conteudoPrincipal">
            <main id="conteudo">
                <div class="slider">
                    <div><img src="imagens/1.jpg" alt="Banner"></div>
                    <div><img src="imagens/2.jpg" alt="Banner"></div>
                    <div><img src="imagens/3.jpg" alt="Banner"></div>
                    <div><img src="imagens/4.jpg" alt="Banner"></div>
                </div>
                <nav id="categorias">
                    <a href=""><div class="itemCategoria">Item1</div></a>
                    <a href=""><div class="itemCategoria">Item2</div></a>
                </nav>
                <div id="itens">
                    <div id="areaContato">
                        <form method="POST" action="contato.php">
                            <h1>Contato</h1><br><br>
                            <p>Nome:*</p>
                            <p><input type="text" size="50" name="txtNome"></p><br>
                            <p>Telefone:</p>
                            <p><input type="text" size="50" name="txtTelefone"></p><br>
                            <p>Celular:*</p>
                            <p><input type="text" size="50" name="txtCelular"></p><br>
                            <p>Email:*</p>
                            <p><input type="email" size="50" name="txtEmail"></p><br>
                            <p>Homepage:</p>
                            <p><input type="text" size="50" name="txtHomepage"></p><br>
                            <p>Link no Facebook:</p>
                            <p><input type="text" size="50" name="txtFacebook"></p><br>
                            <p>Sugestões/Críticas:</p>
                            <textarea rows="5" cols="50" name="txtSugestao"></textarea><br>
                            <p>Informações do produto:</p>
                            <textarea rows="5" cols="50" name="txtInformacao"></textarea><br>
                            <p>Sexo:</p>
                            <p>
                                <input type="radio" name="sexo" value="m"> Masculino
                                <input type="radio" name="sexo" value="f"> Feminino
                            </p>
                            <p>Profissão:</p>
                            <p><input type="text" size="50"  name="txtProfissao"></p><br>
                            <p><input type="submit" name="btnEnviar"></p>
                        </form>
                    </div>
                </div>
            </main>
            <footer id="rodape">
                Todos os direitos reservados.
            </footer>
        </div>
            <div id="redesSociais">
                <div id="twitter"><a href="http://twitter.com"><img src="imagens/twitter.png" alt="Twitter"></a></div>
                <div id="googleplus"><a href="http://plus.google.com"><img src="imagens/googleplus.png" alt="Google plus"></a></div>
                <div id="facebook"><a href="http://facebook.com"><img src="imagens/facebook.png" alt="Facebook"></a></div>
            </div>
        <script src="slick/slick.min.js"></script>
        <script src="slider.js"></script>
        <script src="javascript.js"></script>
    </body>
</html>