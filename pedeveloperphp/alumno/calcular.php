<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>alumno</title>
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
      <a class="navbar-brand" href="#">alumno</a>
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


<!-- Second Container -->
<div class="container-fluid bg-2 text-center">
  <h2>Calcular edad del alumno </h2>
<form class="example" action="search_calcular.php" style="margin:auto;max-width:300px" method="GET">
  <input type="text" placeholder="Ingresar nombre alumno..." name="xnombre" id="search">
  <button type="submit" value="search"><i class="fa fa-search"></i></button>
</form>

</div>

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p></p> 
</footer>
</body>
</html>
