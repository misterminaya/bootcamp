<?php
require_once 'conexion.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Sistemas</title>
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
        <h3 class="text-center">Precio Máximo de Productos con un Store Procedure con parametro de salida</h3>
        <div class="col-12">
            <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Precio Maximo</th> 
                </tr>
                </thead>
                    <?php
                    $q=$pdo->exec('CALL sp_preciomaximo(@xprecio)');
                    $res=$pdo->query('select @xprecio')->fetch();
                    echo '<tr>';
                    echo '<td>'. "Precio máximo de producto: ".$res[0].'</td>';
                    echo '</tr>';
                    ?>
             </table>
        </div>
    </div>
    <div class="row">
        <h3 class="text-center">Precio Mínimo de Productos con un Store Procedure con parametro de salida</h3>
        <div class="col-12">
            <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Precio Minimo</th> 
                </tr>
                </thead>
                    <?php
                    $q=$pdo->exec('CALL sp_preciominimo(@xprecio)');
                    $res=$pdo->query('select @xprecio')->fetch();
                    echo '<tr>';
                    echo '<td>'."Precio mínimo de producto: ".$res[0].'</td>';
                    echo '</tr>';
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
