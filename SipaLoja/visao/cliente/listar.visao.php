<h2>Listar todos os clientes</h2>

<table class="table">
    <thead>
        <tr>
            <th>ID </th>
            <th>NOME</th> 
            <th>SENHA</th> 
            <th>EMAIL</th> 
            <th>CPF</th>
            <th>SEXO</th> 
            <th>NASCIMENTO</th> 
            <th>VIEW</th> 
            <th>EDIT</th>
            <th>DELETE</th>
        </tr>
    </thead>
    <?php foreach ($clientes as $cliente): ?>
    <tr>
        <td><?=$cliente['idcliente']?></td>

        <td><?=$cliente['nome']?></td>

        <td><?=$cliente['senha']?></td>

        <td> <?=$cliente['email']?> </td>

        <td> <?=$cliente['cpf']?> </td>

        <td> <?=$cliente['sexo']?> </td>

        <td> <?=$cliente['nascimento']?> </td>



        <td><a href="./cliente/visualizar/<?=$cliente['idcliente']?>" class="btn btn-secondary">view</a></td>

        <td><a href="./cliente/editar/<?=$cliente['idcliente']?>" class="btn btn-info">edit</a></td>

        <td><a href="./cliente/deletar/<?=$cliente['idcliente']?>" class="btn btn-danger">delete</a></td>
         </tr>

    <?php endforeach; ?>
</table>
 

<br><br> 
<a href="sipaloja/cliente/adicionar" class="btn btn-primary">Adicionar novo cliente</a>

