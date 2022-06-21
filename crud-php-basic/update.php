<?php
include_once 'conexion.php';
$result = false;

if (!empty($_POST)){
    $id = $_POST['id'];
    $newCodigo = $_POST['codigo'];
    $newNombre = $_POST['nombre'];
    $newMarca = $_POST['marca'];
    $newModelo = $_POST['modelo'];
    $newPrecio = $_POST['precio'];
    $newStock = $_POST['stock'];
    $newFabricacion = $_POST['fabricacion'];
    $newFoto = $_POST['foto'];

    $sql = "UPDATE producto SET codigo=:codigo,nombre=:nombre, marca=:marca, 
            modelo=:modelo,precio=:precio,stock=:stock,fabricacion=:fabricacion,foto=:foto WHERE id=:id";
    $query = $pdo->prepare($sql);

    $result = $query->execute([
        'id' => $id,
        'codigo'=> $newCodigo,
        'nombre'=> $newNombre,
        'marca'=> $newMarca,
        'modelo'=> $newModelo,
        'precio'=> $newPrecio,
        'stock'=> $newStock,
        'fabricacion'=> $newFabricacion,
        'foto'=> $newFoto
    ]);
        $codigoValue = $newCodigo;
        $nombreValue = $newNombre;
        $marcaValue = $newMarca;
        $modeloValue = $newModelo;
        $precioValue = $newPrecio;
        $stockValue = $newStock;
        $fabricacionValue = $newFabricacion;
        $fotoValue = $newFoto;

} else {
$id = $_GET['id'];
$sql = "SELECT * FROM producto WHERE id = :id";
$query = $pdo->prepare($sql);

$query->execute([
    'id' => $id
    ]);

$row = $query->fetch(PDO::FETCH_ASSOC);
$codigoValue = $row['codigo'];
$nombreValue = $row['nombre'];
$marcaValue = $row['marca'];
$modeloValue = $row['modelo'];
$precioValue = $row['precio'];
$stockValue = $row['stock'];
$fabricacionValue = $row['fabricacion'];
$fotoValue = $row['foto'];

}

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


<div class="container bg-2">
  <h2>Actualizar Datos Vehiculo</h2>
  <?php 
    if($result) {
        echo '<div class="alert alert-success">Registrado</div>';
    }
  ?>

  <form class="form-row" action="update.php" method="post">
    <div class="form-group">
      <label for="placa">codigo:</label>
      <input type="text" class="form-control" id="codigo" placeholder="Ingresar Codigo" name="codigo" value="<?php echo $codigoValue;?>">
    </div>
    <div class="form-group">
      <label for="marca">nombre:</label>
      <input type="text" class="form-control" id="nombre" placeholder="Ingresar nombre" name="nombre"  value="<?php echo $nombreValue;?>">
    </div>
    <div class="form-group">
      <label for="marca">marca:</label>
      <input type="text" class="form-control" id="marca" placeholder="Ingresar marca" name="marca"  value="<?php echo $marcaValue;?>">
    </div>
    <div class="form-group">
      <label for="modelo">modelo:</label>
      <input type="text" class="form-control" id="modelo" placeholder="Ingresar Modelo" name="modelo"  value="<?php echo $modeloValue;?>">
    </div>
    <div class="form-group">
      <label for="precio">precio:</label>
      <input type="number" class="form-control" id="precio" placeholder="Ingresar precio" name="precio"  value="<?php echo $precioValue;?>">
    </div>
    <div class="form-group">
      <label for="colores">stock:</label>
      <input type="text" class="form-control" id="txtstock" placeholder="Ingresar stock" name="stock"  value="<?php echo $stockValue;?>">
    </div>
    <div class="form-group">
      <label for="fabricacion">Fabricacion:</label>
      <input type="text" class="form-control" id="fabricacion" placeholder="Ingresar fabricacion" name="fabricacion"  value="<?php echo $fabricacionValue;?>">
    </div>
    <div class="form-group">
      <label for="foto">Foto:</label>
      <input type="text" class="form-control" id="foto" placeholder="Ingresar foto" name="foto"  value="<?php echo $fotoValue;?>">
    </div>
    <input type="hidden" name="id"  value="<?php echo $id ?>">
    <button type="submit" class="btn btn-primary" value="update">Actualizar</button>
  </form>
</div>


<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p><a href="#">www.isil.com</a></p> 
</footer>
</body>
</html>
