
<!DOCTYPE html>
<html lang="zxx">
<?php error_reporting(0);
 
 include_once'./cabezera2.php'; 
 include './modelos/verdocente.php'; 
    $conf=$_GET['tconf'];
   $bus = $_POST['tbus'];
  
    if ($conf) {
 echo "<script>alert('Operacion Realizada exitosamente');</script>";

} ?>

<body>
    <section class="about py-3">
        <div class="container py-md-3">
            <h3 class="tittle-wthree text-center">Docentes Registrados</h3>
         <center>
<form action="docente.php"  method="post">
    

                            Buscar:
                            <input type="text"  name="tbus"  value="<?php echo $bus ?>" placeholder="Ingrese Docente">
                        <button type="submit" class="btn btn-primary submit mb-4">Buscar </button>
                   <a href="regdocente.php">   <button type="button" class="btn btn-primary submit mb-4">Registar Nuevo</button></a>  
                        
                        
</form></center>
            <div class="row">

            
                       
<table class="table table-bordered" >

<tr bgcolor="#BEF781">
    <td >Codigo</td><td>Apellidos Y Nombres</td><td>Dni</td><td>Estado</td><td>Editar</td>
</tr> 
<?php 
$sql=buscar($bus);
 $rs=$mysqli->query($sql);  
  while ($row =  $rs->fetch_array()) {

 if($row[6]==1){
    $estado="Activo";
 }else $estado="Inactivo";

  ?>

<tr><td><?php echo $row[0]; ?></td><td><?php echo $row[2]." ".$row[3]." ".$row[1]; ?></td><td><?php echo $row[4]; ?></td><td><?php echo $estado; ?></td>
<td align="center" ><a href="mdocente.php?cod=<?php echo $row[0];?>" ><img src="images/edit.jpg"width="30" height="30"></a></td></tr> 

<?php }    $rs -> close();?>


</table>

                </div>
            </div>

        </div>
    </section>
  
  
</body>

</html>
