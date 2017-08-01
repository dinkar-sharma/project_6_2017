<?php 
    session_start();
    if(!isset($_SESSION['username']))
    {
        echo "<p>You are not authorized users. Click <a href=../request_access.html> here to sign up.</p>"; 
        die();
    }

	function elevator_network_display($dbConn)
	{
	    $query = 'SELECT nodeID, requestedFloor, controllerType, doorState, currentFloor, dateID, timeID FROM (SELECT * FROM elevator_network ORDER BY ID DESC LIMIT 10) sub ORDER BY ID ASC';
	    $rows = $dbConn->query($query);
	    foreach ($rows as $row) 
	    {
	        echo "<tr>";
	        for ($i=0; $i < sizeof($row)/2 ; $i++) 
	        { 
	            echo "<td>".$row[$i]."</td>";
	        }
	        echo "</tr>";
	    }
	}


	function elevator_network_write($dbConn, $requestedFloor, $doorState, $controllerType)
	{
	    try
	    {
	    	$query = 'INSERT INTO elevator_network(nodeID, requestedFloor, controllerType, doorState, currentFloor, dateID, timeID) VALUES (100, :requestedFloor, :controllerType, :doorState, :currentFloor, :dateID, :timeID)';
	    	$dbConn->beginTransaction();
		    $statement = $dbConn->prepare($query);
		    $curr_date_query = $dbConn->query('SELECT CURRENT_DATE()');
		    $curr_date = $curr_date_query->fetch(PDO::FETCH_ASSOC);
		    $curr_time_query = $dbConn->query('SELECT CURRENT_TIME()');
		    $curr_time = $curr_time_query->fetch(PDO::FETCH_ASSOC);
		    $currentFloor = $_POST['currentFloor'] ?? '';

		    $params = [
		        'requestedFloor' => $requestedFloor,
		        'controllerType' => $controllerType,
		        'doorState' => $doorState,
		        'currentFloor' => $currentFloor,
		        'dateID' => $curr_date['CURRENT_DATE()'],
		        'timeID' => $curr_time['CURRENT_TIME()']
		    ];
		   
		    if(!$statement->execute($params)) 
		    {
		       throw new Exception("elevator_network_write: Error executing statement");
		    }
		    $dbConn->commit();
	    
	    } 
	    catch (Exception $e) 
	    {
	    	$dbConn->rollBack();
	    	echo "Failed: " .$e->getMessage();
	    }

	}

	function connect_to_database()
	{
		try 
		{
		    $db = new PDO(
		    'mysql:host=127.0.0.1;dbname=elevator_project_2017',
		    'root',
		    '');
		} 
		catch (Exception $e) 
		{
		    echo "Error connecting to database: " .$e->getMessage();
		}
		
		return $db;
	}

	$request = $_POST['request'] ?? '';
	$doorState = '';
	$controllerType = 'EC';
	$requestedFloor = 'na';

	switch ($request) 
	{
		case 'car-1-req':
			$requestedFloor = 1;
			break;
		case 'car-2-req':
			$requestedFloor = 2;
			break;
		case 'car-3-req':
			$requestedFloor = 3;
			break;
		case 'floor-1-req':
			$requestedFloor = 1;
			$controllerType = 'FC';
			break;
		case 'floor-2-req':
			$requestedFloor = 2;
			$controllerType = 'FC';
			break;
		case 'floor-3-req':
			$requestedFloor = 3;
			$controllerType = 'FC';
			break;
		case 'open':
			$doorState = 'open';
			$requestedFloor = '';
			break;
		case 'close':
			$doorState = 'close';
			$requestedFloor = '';
			break;
		default:
			$requestedFloor = 'na';
			break;
	}

	// prevent inserting into database on a refresh
	if($requestedFloor != 'na')
	{
		$db = connect_to_database();
		elevator_network_write($db, $requestedFloor, $doorState, $controllerType);
	}
?>