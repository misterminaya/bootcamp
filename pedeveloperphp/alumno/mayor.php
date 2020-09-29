<?php
require_once 'conexion.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Alumno</title>
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
      <a class="navbar-brand" href="#">Alumno</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
         <li><a href="calcular.php">Calcular Edad</a></li>
         <li><a href="estado.php">Estado Alumno</a></li>
         <li><a href="index.php">Promedio</a></li>
         <li><a href="mayor.php">Mayor Nota</a></li>
         <li><a href="menor.php">Menor Nota</a></li>
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
                    <th>mayornota</th>

                    
                </tr>
                    <?php
                    $queryResult = $pdo->query("CALL sp_mayornota()");
                    while($row = $queryResult->fetch()){
                        echo '<tr>';
                        echo '<td>'. $row['codigo'].'</td>';
                        echo '<td>'. $row['nombre'].'</td>';
                        echo '<td>'. $row['mayornota'].'</td>';
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
