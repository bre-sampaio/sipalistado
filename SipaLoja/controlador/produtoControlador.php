<?php

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


	} else {
		exibir("produto/formulario");
	}
	
	
} 









?>