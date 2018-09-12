<?php
    function insertBanco($nome, $telefone, $celular, $email, $homepage, $facebook, $sugestao, $informacao, $sexo, $profissao){
        $host = "localhost";
        $database = "mydb";
        $user = "root";
        $password = "bcd127";

        if(!$conexao = mysqli_connect($host, $user, $password, $database)){
            echo("Erro na conexão com banco de dados.");
        }

        $sql = "INSERT INTO tbl_contatos
                    (nome, telefone, celular, email, homepage, facebook, sugestao, informacao, sexo, profissao)
                    VALUES
                    ('".$nome."', '".$telefone."', '".$celular."', '".$email."', '".$homepage."', '".$facebook."', '".$sugestao."', '".$informacao."', '".$sexo."', '".$profissao."');";

        mysqli_query($conexao, $sql);
        
        echo($sql);
    }
?>