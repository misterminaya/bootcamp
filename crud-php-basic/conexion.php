<?php
/*Datos de conexion a la base de datos*/
$db_host = 'localhost';
$db_name = 'dbventa';
$db_user = 'root';
$db_pass = '';

try {
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
    $pdo-> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}
catch(Exception $e){
    echo $e->getMessage();
}


?>