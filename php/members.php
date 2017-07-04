<?php

function updateUsers(int $user_ID, string $user_name, string $pass_word): void{
		$db = new PDO(
		'mysql:host=127.0.0.1;dbname=elevator',
		'root',
		'');
		$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
		$query = 'UPDATE users SET userName = :user, password = :pass where userID = ID';
		$statement = $db->prepare($query);
		$statement->bindValue('user', $user_name);
		$statement->bindValue('pass', $pass_word);
		$statement->bindValue('ID', $user_ID);
		$statement->ececute();
}

$db = new PDO(
		'mysql:host=127.0.0.1;dbname=elevator',
		'root',
		'');
	$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	$query2 = 'SELECT * FROM users';
	$rows = $db->query($query2);
	foreach ($rows as $row) {
		var_dump($row);
		echo"<br /><br />";
		# code...
	}


?>