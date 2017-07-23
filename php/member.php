<?php 
	session_start();

    if(isset($_SESSION['username']))
    {
        echo "welcome, " .$_SESSION['username'];
     	header("Refresh: 1, url=elevator_control.php");  
    }
    else
    {
        echo "You are not authorized user";
    }
 ?>
