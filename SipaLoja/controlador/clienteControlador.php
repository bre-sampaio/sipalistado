<?php

require_once "modelo/clienteModelo.php";



function adicionar(){
	
	if (ehPOST()) {

	//validação do nome
		
		if (strlen(trim($_POST['nome'])) == 0) {
 			$errors[] = "Informe um nome válido.i";
		 }
		$nome = $_POST["nome"];


	//validação da senha

		if (strlen(trim($_POST['senha'])) == 0) {
 			echo "Você deve inserir uma senha válida.<br><BR>";
		}
			$senha = $_POST["senha"];

		
	//validação do email

		$input['Email'] = filter_input(INPUT_POST, 'Email', FILTER_VALIDATE_EMAIL);
 	if ($input['Email'] == FALSE) {
 		echo 'Informe um email valido. <br><BR>';
	}
		$email = $_POST["Email"];


	//validação do cpf
	
		$cpf = $_POST["cpf"];

		$sexo = $_POST["sexo"];

		$nascimento = $_POST["nascimento"];

	$msg = adicionarCliente($nome, $email, $senha, $cpf, $sexo, $nascimento);
		echo $msg;


	} else {
		exibir("produto/formulario");
	}
	
	
} 


	/* chama a func "pegarTodosClientes" para passar os dados para a func "exibir" */


	function listarClientes(){
		$dados = array();
		$dados["clientes"] = pegarTodosClientes();
		exibir("cliente/listar", $dados);

	}








?>