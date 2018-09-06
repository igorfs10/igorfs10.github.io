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
        
        
        //'".var."' para qualquer variavel e ".var." para inteiro
        $sql = "INSERT INTO tblcontatos
                (nome, email, telefone, celular, data_nascimento, obs)
                VALUES
                ('".$nome."', '".$email."', '".$telefone."', '".$celular."', '".$dataNascimento."', '".$obs."');";
        
        // verifica string gerada
        //echo($sql);
        
        mysqli_query($conexao, $sql);
        
        //Redireciona para a pagina
        header('location:formulario.php');
    }
    
    if(isset($_GET['modo'])){
        $modo = $_GET['modo'];
        //Excluir do banco de dados
        if($modo == "excluir"){
            $codigo = $_GET['codigo'];
            $sql = "DELETE FROM tblcontatos where codigo=" . $codigo;
            mysqli_query($conexao, $sql);
            echo($sql);
            header('location:formulario.php');
        }
    }
    

?>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<title>
            Formulario Banco de Dados
		</title>
        
        <script>
            const BLOQUEA_NUMERO = 0,
                  BLOQUEA_CARACTERE = 1;
            
            function validar(caracter, blockType, objeto){
                objeto.style.backgroundColor = "white";
                //Guarda o ASCII da letra digitada
                if(window.event){
                    var letra = caracter.charCode;
                }else{
                    var letra = caracter.which;
                }
                
                if(blockType == BLOQUEA_CARACTERE){
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
        <div id="conteudo">
            <form name="frm" method="POST" action="formulario.php">
                <!-- Type para form
                    tel, date,month,week,email,range,number,color,url
                -->
                ID:<br>
                <input type="text" name="txtId" value="" readonly><br><br>
                Nome:*<br>
                <input type="text" name="txtNome" value="" onkeypress="return validar(event, BLOQUEA_NUMERO, this)" required><br><br>
                E-mail*:<br>
                <input type="email" name="txtEmail" value="" required><br><br>
                Telefone:*<br>
                <input type="text" name="txtTelefone" value="" onkeypress="return validar(event, BLOQUEA_CARACTERE, this)" required><br><br>
                Celular:*<br>
                <input type="text" name="txtCelular" value="" pattern="[0-9]{3} [0-9]{5}-[0-9]{4}" required><br><br>
                Data de nascimento:*<br>
                <input type="date" name="txtDataNascimento" value="" required><br><br>
                Obs:<br>
                <textarea name="txtObs" rows="3" cols="50"></textarea><br><br>
                <input type="submit" name="btnEnviar">
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
                    <a href=""><img src="imagens/lupa.png"></a>
                    <a href=""><img src="imagens/lapis.png"></a>
                    <a href="formulario.php?modo=excluir&codigo=<?php echo($rsContatos['codigo']) ?>"><img src="imagens/lixeira.png"></a>
                </td>
            </tr>
            <?php
                }
            ?>
        </table>
    </body>
</html>