<!doctype html>
<?php
    //Apaga a image uploadada
    //unlink("arquivos/2e808044da0ae6e8caa42bf2f717f868.png");

    //Conexao banco de dados
    $host = "localhost";
    $database = "db_biblioteca_inf3m";
    $user = "root";
    $password = "bcd127";

    if(!$conexao = mysqli_connect($host, $user, $password, $database)){
        echo("Erro na conexão com banco de dados.");
    }

    if(isset($_POST["txtNome"])){
        $nome = $_POST["txtNome"];
        $foto = $_POST["txtFoto"];
        
        $sql = "INSERT INTO tbl_fotos (nome, foto)
                values('".$nome."','".$foto."')";
        mysqli_query($conexao, $sql);
    }

?>
<html lang="pt-br">
	<head>
        <link rel="stylesheet" type="text/css" href="css/style.css">
		<meta charset="UTF-8">
		<title>
            Upload Imagem
		</title>
	</head>
	<body>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script>
        $(document).ready(function(){
            // Na ação do live do elemento file, que significa algo ser carregado com um arquivo(foto), será acionado
            $("#foto").live("change",function(){
                
                //Coloca um gif animado para criar uma interação com o usuario
                $("#visualizar").html("<img src='imagens/ajax-loader.gif'>");
                
                setTimeout(function(){
                    //Forçando um submit no formulario do file upload para conseguir realizar o upload  da foto sem um clique de um botão
                
                    //O retorno da página upload.php que será submetido pelo formulário deverá ser descarregada na div visualizar. Para isso usamos o atributo target do ajaxForm (isso é conhecido como callback)
                    $("#frmFoto").ajaxForm({
                        target:"#visualizar"
                    }).submit();
                }, 2000);
            });
            //Colocando gif animado no click do botao
            $("#btnSalvar").click(function(){
                 $("#visualizar").html("<img src='imagens/ajax-salvando.gif'>");
                
                setTimeout(function(){
                    frm.submit();
                }, 2000);
            });
        });
        </script>
        <!-- Upload de image só funciona no post e com enctype multipart/form-data -->
        <form id="frmFoto" name="formFoto" method="POST" action="upload.php" enctype="multipart/form-data">
            <div id="visualizar">
            </div>
            Foto:<input type="file" name="fleFoto" id="foto">
        </form>
        
        <!-- Para fazer upload usando jquery, precisamos separar o código de upload -->
        
        <form name="frm" method="POST" action="formulario.php">
            Nome: <input type="text" name="txtNome">
            <br>
            <input type="text" name="txtFoto">
            <br>
            <input type="button" id="btnSalvar" name="btnSubmit" value="Salvar">
        </form>
        <br>
        <br>
        <br>
        <table width="100%" border="5">
            <tr>
                <td>
                    Nome
                </td>
                <td>
                    Foto
                </td>
            </tr>
            <?php
            $sql = "SELECT * FROM tbl_fotos";
            $select = mysqli_query($conexao, $sql);
            while($rsFoto = mysqli_fetch_array($select)){            
            ?>
            <tr>
                <td>
                    <?php echo($rsFoto['nome'])?>
                </td>
                <td>
                    <img src="<?php echo($rsFoto['foto'])?>" width="20px" height="20px">
                </td>
            </tr>
            <?php } ?>
        </table>
    </body>
</html>