<!doctype html>
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
                    <div class="quadroBanca">
                        <div class="imagemMapa"><img src="imagens/mapa.png"></div>
                        <div class="textoBanca">
                            <h1 class="tituloNoticia">Vila Mariana</h1>
                            <p>Banca Vila Mariana</p>
                            <p>Estado: SP</p>
                            <p>Cidade: São Paulo</p>
                            <p>Bairro: Vila Mariana</p>
                            <p>Rua: Gandavo, nº 125</p>
                            <p>Localizada em uma das ruas mais importantes do bairro, essa banca foi inaugurada em 1999.</p>
                        </div>
                    </div>
                    <div class="quadroBanca">
                        <div class="imagemMapa"><script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script><div style='overflow:hidden;height:230px;width:280px;'><div id='gmap_canvas' style='height:230px;width:280px;'></div><div><small><a href="https://embedgooglemaps.com/it/">embedgooglemaps IT</a></small></div><div><small><a href="http://eurodisneyaanbiedingen.nl/">euro disney aanbiedingen | beste deals - book nu!</a></small></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div><script type='text/javascript'>function init_map(){var myOptions = {zoom:10,center:new google.maps.LatLng(38.7222524,-9.139336599999979),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(38.7222524,-9.139336599999979)});infowindow = new google.maps.InfoWindow({content:'<strong>Banca</strong><br>Sao Paulo, Brasil<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script></div>
                        <div class="textoBanca">
                            <h1 class="tituloNoticia">Vila Mariana</h1>
                            <p>Banca Vila Mariana</p>
                            <p>Estado: SP</p>
                            <p>Cidade: São Paulo</p>
                            <p>Bairro: Vila Mariana</p>
                            <p>Rua: Gandavo, nº 125</p>
                            <p>Localizada em uma das ruas mais importantes do bairro, essa banca foi inaugurada em 1999.</p>
                        </div>
                    </div>
                    <div class="quadroBanca">
                        <div class="imagemMapa"><img src="imagens/mapa.png"></div>
                        <div class="textoBanca">
                            <h1 class="tituloNoticia">Vila Mariana</h1>
                            <p>Banca Vila Mariana</p>
                            <p>Estado: SP</p>
                            <p>Cidade: São Paulo</p>
                            <p>Bairro: Vila Mariana</p>
                            <p>Rua: Gandavo, nº 125</p>
                            <p>Localizada em uma das ruas mais importantes do bairro, essa banca foi inaugurada em 1999.</p>
                        </div>
                    </div>
                    <div class="quadroBanca">
                        <div class="imagemMapa"><img src="imagens/mapa.png"></div>
                        <div class="textoBanca">
                            <h1 class="tituloNoticia">Vila Mariana</h1>
                            <p>Banca Vila Mariana</p>
                            <p>Estado: SP</p>
                            <p>Cidade: São Paulo</p>
                            <p>Bairro: Vila Mariana</p>
                            <p>Rua: Gandavo, nº 125</p>
                            <p>Localizada em uma das ruas mais importantes do bairro, essa banca foi inaugurada em 1999.</p>
                        </div>
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