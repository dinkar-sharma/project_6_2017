<?php
	session_start();
	echo "my nigga";
	header("Location: ../index.html")
	session_destroy();
	//echo"You have been logged out. Click <a href='login.html'>here</a> to log in again";
?>