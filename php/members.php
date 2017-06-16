<?php

session_start();
//$username = $_POST['username'];
//$password = $_POST['password'];
if(isset($_SESSION['username'])) {
	echo"<p>Welcome to members page,</p>" . $_SESSION['username'] . "!<br />";
	echo"<p>Members only content - for your eyes only</p>";
	echo "Click to <a href='logout.php'>Logout</a>";

} else {
	echo "<p>You must be logged in!</p>";
}

?>