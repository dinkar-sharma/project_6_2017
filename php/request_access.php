<?php  
		
	$db = new PDO(
	'mysql:host=127.0.0.1;dbname=elevator',
	'root',
	'');
	$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	$query = 'INSERT INTO users (userName, password)
			  VALUES (:userName, :password) ';
	$statement = $db->prepare($query);
	$params = [
			'userName' => $_POST['userName'],
			'password' => $_POST['password']
			];

	$result = $statement->execute($params);
?>