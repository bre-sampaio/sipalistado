<?php

	function adicionarCliente($nome, $email, $senha, $cpf, $sexo, $nascimento){
		$sql = "INSERT INTO cliente ( nome, 
									  email, 
									  senha, 
									  cpf, 
									  sexo, 
									  nascimento)
				VALUES('$nome', 
						'$senha', 
						'$email', 
						'$cpf', 
						'$sexo', 
						'$nascimento')";

		$resultado = mysqli_query($cnx = conn(), $sql);

		if(!$resultado) {

			die('erro ao cadastrar cliente <br>' .mysqli_error($cnx));
		}

		return 'Cadastro realizado com sucesso!';
	}



	function pegarTodosClientes(){
		$sql = "SELECT * FROM cliente";
		$resultado = mysqli_query(conn(), $sql);
		$clientes = array();
		while ($linha = mysqli_fetch_assoc($resultado)) {
			$clientes[] = $linha;
		}

		return $clientes;
	}





















?>

