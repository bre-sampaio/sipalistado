<?php

function conn() {
    $cnx = mysqli_connect("localhost", "root", "", "sipaloja");
    if (!$cnx) die('Deu errado a conexao!');
    return $cnx;
}


