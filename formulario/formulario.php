<!doctype html>
<?php
    $host = "localhost";
    $database = "dbcontatos2018inf3m";
    $user = "root";
    $password = "bcd127";
    
    $id = "";
    $nome = "";
    $email = "";
    $telefone = "";
    $celular = "";
    $dataNascimento = "";
    $obs = "";
    $botao = "Inserir";
    
    //Ativa o uso de variáveis de sessão (Globais)
    session_start();
    
    //Se usar o Mysql connect
    //mysqli_connect($host, $user, $password);
    //mysql_selectdb($database);


    //Estabelece a conexão com o banco de dados Mysql, usando a biblioteca Mysqli connect
    if(!$conexao = mysqli_connect($host, $user, $password, $database)){
        echo("Erro na conexão com banco de dados.");
    }

    //Verifica se o botão foi acionado pelo usuário
    if(isset($_POST["btnEnviar"])){
        $id = $_POST["txtId"];
        $nome = $_POST["txtNome"];
        $email = $_POST["txtEmail"];
        $telefone = $_POST["txtTelefone"];
        $celular = $_POST["txtCelular"];
        $dataNascimento = $_POST["txtDataNascimento"];
        $obs = $_POST["txtObs"];
        
        //Se usar date use "-" para quebrar a data
        //$data = explode("-", $dataNascimento);
        
        //Não necessario se usar date para converter no padrão do banco de dados
        //$dataNascimento = $data[0]."-".$data[1]."-".$data[2];
        
        if($_POST["btnEnviar"] == "Inserir"){
            
            //'".var."' para qualquer variavel e ".var." para inteiro
            $sql = "INSERT INTO tblcontatos
                    (nome, email, telefone, celular, data_nascimento, obs)
                    VALUES
                    ('".$nome."', '".$email."', '".$telefone."', '".$celular."', '".$dataNascimento."', '".$obs."');";


        } else if($_POST["btnEnviar"] == "Editar"){
            $sql = "UPDATE tblcontatos SET
                        nome='".$nome."', email='".$email."', telefone='".$telefone."', celular='".$celular."',
                        data_nascimento='".$dataNascimento."', obs='".$obs."'
                    
                    WHERE codigo=".$_SESSION["codigo"];
        }
        
        // verifica string gerada
        //echo($sql);
        mysqli_query($conexao, $sql);
        
        //Redireciona para a pagina
        header('location:formulario.php');
    }
    
    //Verifica a existencia da variavel modo na url
    //A variavel modo é enviada para a url através do link na tabela da consulta, assim como o id do resgistro que sera excluido ou editado
    if(isset($_GET['modo'])){
        $modo = $_GET['modo'];
        //Excluir do banco de dados
        if($modo == "excluir"){
            $codigo = $_GET['codigo'];
            $sql = "DELETE FROM tblcontatos where codigo=" . $codigo;
            mysqli_query($conexao, $sql);
            header('location:formulario.php');
        }else if($modo == "buscar"){
            $botao = "Editar";
            $codigo = $_GET["codigo"];
            
            //Cria uma variavel de sessao para guardar o id do registro
            $_SESSION["codigo"] = $codigo;
            
            $sql = "SELECT * FROM tblcontatos WHERE codigo=" . $codigo;
            $select = mysqli_query($conexao, $sql);
            
            if($rsConsulta = mysqli_fetch_array($select)){
                //Guardando o conteudo que o banco de dados retornou no select
                $nome = $rsConsulta["nome"];
                $email = $rsConsulta["email"];
                $telefone = $rsConsulta["telefone"];
                $celular = $rsConsulta["celular"];
                $dataNascimento = $rsConsulta["data_nascimento"];
                
                //Converter string para data e arrumando o formato de data
                //$dataNascimento2 = date('d/m/Y',strtotime ($dataNascimento));
                //echo($dataNascimento2);
                
                $obs = $rsConsulta["obs"];
            }
        }
    }
    

?>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<title>
            Formulario Banco de Dados
		</title>
        
        
        <script src="js/jquery.js"></script>
        
        
        <script>
            
            $(document).ready(function(){
                
                // Function para abrir a janela modal
                $(".visualizar").click(function(){
                    $("#container").fadeIn(100);
                });
                
            });
            
        </script>
        
        
        <script>
            const BLOQUEA_NUMERO = 0,
                  BLOQUEA_CARACTERES = 1;
            
            function validar(caracter, blockType, objeto){
                objeto.style.backgroundColor = "white";
                //Guarda o ASCII da letra digitada
                if(window.event){
                    var letra = caracter.charCode;
                }else{
                    var letra = caracter.which;
                }
                
                if(blockType == BLOQUEA_CARACTERES){
                    //Bloqueio de numero
                    if(letra < 48 || letra > 57){
                        objeto.style.backgroundColor = "red";
                        //Cancela a ação da tecla
                        return false;
                    }
                }else{
                    //Bloqueio de caracter
                    if(letra >= 48 && letra <= 57){
                        objeto.style.backgroundColor = "red";
                        //Cancela a ação da tecla
                        return false;
                    }
                }  
            }
        </script>
        
        <style>
            *{
                margin: 0px;
                padding: 0px;
                font-size: 1.1em;
            }
            
            #container{
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
                position: fixed;
                z-index: 999;
                display: none;
            }
            
            #modal{
                width: 1000px;
                height: 900px;
                background-color: #ffffff;
                margin-left: auto;
                margin-right: auto;
                margin-top: 100px;
            }
            
            #conteudo{
                width: 700px;
                height: 800px;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            
            .nomeTabela{
                color: azure;
                background-color: green;
                text-align: center;
            }
            
            .descricaoColuna{
                background-color: #aaaaaa;
                text-align: center;
            }
            
            .dadosColuna{
                text-align: center;
            }
            
            .dadosColuna img{
                height: 20px;
                width: 20px;
            }
            
            textarea{
                resize: none;
            }
            
        </style>
	</head>
	<body>
        <!-- Código para gerar a tela da modal no navegador-->
        <div id="container">
            <div id="modal">
            </div>
        </div>
        
        
        <!-- Div do formulario-->
        <div id="conteudo">
            <form name="frm" method="POST" action="formulario.php">
                <!-- Type para form
                    tel, date,month,week,email,range,number,color,url
                -->
                Nome:*<br>
                <input type="text" name="txtNome" value="<?php echo($nome)?>" onkeypress="return validar(event, BLOQUEA_NUMERO, this)" required><br><br>
                E-mail*:<br>
                <input type="email" name="txtEmail" value="<?php echo($email)?>" required><br><br>
                Telefone:*<br>
                <input type="text" name="txtTelefone" value="<?php echo($telefone)?>" onkeypress="return validar(event, BLOQUEA_CARACTERES, this)" required><br><br>
                Celular:*<br>
                <input type="text" name="txtCelular" value="<?php echo($celular)?>" pattern="[0-9]{3} [0-9]{5}-[0-9]{4}" required><br><br>
                Data de nascimento:*<br>
                <input type="date" name="txtDataNascimento" value="<?php echo($dataNascimento)?>" required><br><br>
                Obs:<br>
                <textarea name="txtObs" rows="3" cols="50"><?php echo($obs)?></textarea><br><br>
                <input type="submit" name="btnEnviar" value="<?php echo($botao)?>">
            </form>
        </div>
        <table border="1" width="100%" height="100%">
            <tr>
                <td colspan="5" class="nomeTabela">Consulta de contatos</td>
            </tr>
            <tr>
                <td width="20%" class="descricaoColuna">Nome</td>
                <td width="20%" class="descricaoColuna">Telefone</td>
                <td width="20%" class="descricaoColuna">Celular</td>
                <td width="20%" class="descricaoColuna">Email</td>
                <td width="20%" class="descricaoColuna">Opções</td>
            </tr>
            
            <?php
                $sql = "SELECT * FROM tblcontatos ORDER BY CODIGO DESC";
            
                $select = mysqli_query($conexao, $sql);
                
                while($rsContatos = mysqli_fetch_array($select)){
            ?>
            <tr>
                <td width="20%" class="dadosColuna"><?php echo($rsContatos['nome']) ?></td>
                <td width="20%" class="dadosColuna"><?php echo($rsContatos['telefone']) ?></td>
                <td width="20%" class="dadosColuna"><?php echo($rsContatos['celular']) ?></td>
                <td width="20%" class="dadosColuna"><?php echo($rsContatos['email']) ?></td>
                <td width="20%" class="dadosColuna">
                    <a href="#" class="visualizar"><img src="imagens/lupa.png"></a>
                    <a href="formulario.php?modo=buscar&codigo=<?php echo($rsContatos['codigo']) ?>"><img src="imagens/lapis.png"></a>
                    <a href="formulario.php?modo=excluir&codigo=<?php echo($rsContatos['codigo']) ?>"><img src="imagens/lixeira.png"></a>
                </td>
            </tr>
            <?php
                }
            ?>
        </table>
    </body>
</html>