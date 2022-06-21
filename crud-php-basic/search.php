<?php
require_once 'conexion.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>sistemas</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Tienda</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.php">Consultar</a></li>
        <li><a href="lista.php">Lista</a></li>
        <li><a href="registrar.php">Registrar</a></li>
        <li><a href="precio.php">Precio</a></li>
        <li><a href="stock.php">Stock Productos</a></li>
      </ul>
    </div>
  </div>
</nav>
    
<div class="container">
    <div class="row">
        <div class="col">
            <table class="table">
                <tr>
                    <th>codigo</th>
                    <th>nombre</th>
                    <th>marca</th>
                    <th>modelo</th>
                    <th>precio</th>
                    <th>stock</th>
                    <th>fabricacion</th>
                    <th>foto</th>
                    <th>Editar</th>
                    <th>Borrar</th>
                    <!-- SELECT *FROM producto WHERE codigo='$codigo -->
  
                    
                </tr>
                    <?php
                    $codigo = $_GET['codigo'];
                    $queryResult = $pdo->query("CALL sp_buscar('$codigo')");
                    while($row = $queryResult->fetch()){
                        echo '<tr>';
                        echo '<td>'. $row['codigo'].'</td>';
                        echo '<td>'. $row['nombre'].'</td>';
                        echo '<td>'. $row['marca'].'</td>';
                        echo '<td>'. $row['modelo'].'</td>';
                        echo '<td>'. $row['precio'].'</td>';
                        echo '<td>'. $row['stock'].'</td>';
                        echo '<td>'. $row['fabricacion'].'</td>';
                        echo '<td>'. $row['foto'].'</td>';
                        echo '<td><a href="update.php?id='.$row['id'] .'">Editar</a></td>';
                        echo '<td><a href="delete.php?id='.$row['id'] .'">Borrar</a></td>';
                        echo '</tr>';
                
                    }
                     
                    ?>
             </table>
        </div>
    </div>
</div>


<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p><a href="#">www.isil.com</a></p> 
</footer>
</body>
</html>
