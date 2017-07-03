<?php

session_start();
$username = $_POST['username'];
$password = $_POST['password'];


	//$_SESSION['username']=$username;
	$db = new PDO(
		'mysql:host=127.0.0.1;dbname=elevator',
		'root',
		'');
	$authenticated = FALSE;
	$rows = $db->query('SELECT * FROM users ORDER BY userID');
	foreach ($rows as $row){
		if ($username == $row[1] && $password == $row[2]){
			$authenticated = TRUE;

		}
	}
	if ($authenticated == TRUE){
		$_SESSION['username']=$username;
	
	header("Location: ../elevator_control.html");
	}
	else{
		echo"<p>Please enter a username and password</p>";
	}


?>