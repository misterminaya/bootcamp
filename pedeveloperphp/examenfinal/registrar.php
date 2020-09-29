<?php 

require_once 'conexion.php';


if (!empty($_POST)) {
    $codigo = $_POST['codigo'];
    $producto = $_POST['producto'];
    $precio = $_POST['precio'];
    $stock =  $_POST['stock'];
    $fabricacion = $_POST['fabricacion'];
    $foto = $_POST['foto'];

    $sql = "INSERT INTO producto(codigo,producto,precio,stock,fabricacion,foto)
    VALUES (:codigo, :producto, :precio, :stock, :fabricacion, :foto)";
    $query = $pdo->prepare($sql);

    $result = $query->execute([
        'codigo' => $codigo,
        'producto' => $producto,
        'precio' => $precio,
        'stock' => $stock,
        'fabricacion' => $fabricacion,
        'foto' => $foto,
    ]); 

    if ($result ==1){
        echo '<div class="alert alert-success">Registrado</div>';
    }
    
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>drones</title>
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
      <a class="navbar-brand" href="#">DELTRON S.A </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
         <li><a href="index.php">Consultar</a></li>
        <li><a href="lista.php">Lista</a></li>
        <li><a href="registrar.php">Registrar</a></li>
      </ul>
    </div>
  </div>
</nav>


<div class="container bg-2">
  <h2>Registrar Datos del drone</h2>
  
  <form class="form-row" action="registrar.php" method="post">
    <div class="form-group">
      <label for="dni">Codigo:</label>
      <input type="text" class="form-control" id="codigo" placeholder="Ingresar codigo" name="codigo">
    </div>
    <div class="form-group">
      <label for="nombre">Producto:</label>
      <input type="text" class="form-control" id="producto" placeholder="Ingresar producto" name="producto">
    </div>
    <div class="form-group">
      <label for="edad">Precio:</label>
      <input type="number" class="form-control" id="precio" placeholder="Ingresar precio" name="precio">
    </div>
    <div class="form-group">
      <label for="sexo">Stock:</label>
      <input type="text" class="form-control" id="stock" placeholder="Ingresar stock" name="stock">
    </div>
    <div class="form-group">
      <label for="celular">Fabricacion:</label>
      <input type="text" class="form-control" id="fabricacion" placeholder="Ingresar fabricacion" name="fabricacion">
    </div>
    <div class="form-group">
      <label for="foto">Foto:</label>
      <input type="text" class="form-control" id="foto" placeholder="Ingresar foto" name="foto">
    </div>
    <button type="submit" class="btn btn-primary">Enviar Datos</button>
  </form>
</div>


<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p><a href="#">www.isil.com</a></p> 
</footer>
</body>
</html>
