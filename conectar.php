<?php
    $conexion = oci_connect("PRBANCO","1245780","localhost/XEPDB1");
    if($conexion)
    {
        echo 'Conexion establecida';
    }
    else
    {
        echo 'Error al intentar conectar';
    }
?>