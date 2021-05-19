<?php

//print_r($_POST);
$id = $_POST['Id'];
$nombre = $_POST['Nombre'];
$dpi = $_POST['Dpi'];
$telefono = $_POST['Telefono'];
$email = $_POST['Email'];


require_once('../conexion.php');

$oraclePDO = new Conexion();
$conexion = $oraclePDO->Conectar();
try {
    if($id!=null and $nombre !=null and $dpi!=null and $email!=null and $telefono!=null){
        $conexion->beginTransaction();
        $query= "insert into clientes (Id,Nombre,Dpi,Telefono,Email) values ('".$id.",".$nombre."','".$dpi."',".$telefono.",'".$email."')";
        $stmt = $conexion->prepare($query);
        $stmt->execute();
        $conexion->commit();
        header("location:../clientes/Clientes.php");
        //echo "los datos se almacenaro correctamente";
    }
} catch (Exception $ex) {
    echo "Error: ".$ex->getMessage();
}


