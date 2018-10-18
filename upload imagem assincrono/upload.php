<?php
if(isset($_POST)){
        //$nome = $_POST["txtNome"];
        
        //Pega o nome do arquivo a ser enviado para o servidor
        $arquivo = $_FILES["fleFoto"]["name"];
        
        //Pega o tipo de arquivo
        //$nome_arquivo = $_FILES["fleFoto"]["name"];
        
        $tamanhoArquivo = $_FILES["fleFoto"]["size"];
        
        //Converte os bytes em kb e arredonda
        $tamanhoArquivo = round($tamanhoArquivo / 1024);
        
        //Pega a extensão do arquivo com .
        $extArquivo = strrchr($arquivo, ".");
        
        //Pega a extensão do arquivo sem .
        //$extArquivo = pathinfo($arquivo, PATHINFO_EXTENSION);
        
        //Pega o nome do arqivo sem extensao
        $nomeArquivo = pathinfo($arquivo, PATHINFO_FILENAME);
        
        /*
        md5     >>>>> criptografa uma string,
        uniqid  >>>>> gera um numero individual e aleatorio baseado em uma informação
        time()  >>>>> pega a hora, minuto, e segundo do servidor
        
        Criptografa a variavel para criar um nome unico
        */
        $nomeArquivo = md5(uniqid(time()).$nomeArquivo);
        
        //guarda o diretorio que será feito o upload do arquivo
        $diretorioArquivo = "arquivos/";
        
        //cria um vetor contendo as extensoes validas para o upload de arquivo
        $arquivosPermitidos = array(".jpg", ".png", ".jpeg");
        
        if(in_array($extArquivo, $arquivosPermitidos)){
            if($tamanhoArquivo <= 2000){
                $arquivoTmp = $_FILES["fleFoto"]["tmp_name"];
                $foto = $diretorioArquivo . $nomeArquivo . $extArquivo;
                
                if(move_uploaded_file($arquivoTmp, $foto)){
                    /*$sql = "INSERT INTO tbl_fotos (nome, foto)
                            values('".$nome."','".$foto."')";
                    mysqli_query($conexao, $sql);
                    */  
                    echo("<img src='" . $foto . "'>");
                    
                    //coloca na caixa de texto o endereço da foto no formulario para ser inserido no banco de dados
                    echo("
                        <script>
                        frm.txtFoto.value='" . $foto . "'
                        </script>
                    ");
                    
                }else{
                    echo("Não deu certo");
                }
                
            }else{
                echo("Muito Grande<br>");
            }
            
        }else{
            echo("Extensão inválida<br>");
        }
                
    }
?>