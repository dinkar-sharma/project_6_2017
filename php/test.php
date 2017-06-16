<?php

session_start();
$username = $_POST['username'];
$password = $_POST['password'];

if($username&&$password){
	$_SESSION['username']=$username;
	//echo"<p>Congratulations</p>";
	//echo "<p>Please click <a href=\"members.php\">here</a> to be taken to our members only page</p>";
	header("Location: ../elevator_control.html");
} else{
	echo"<p>Please enter a username and password</p>";
}

?>