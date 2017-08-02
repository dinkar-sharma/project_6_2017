<?php 
    session_start();
    if(!isset($_SESSION['username']))
    {
        echo "<p>You are not authorized users. Click <a href=../request_access.html> here to sign up.</p>"; 
        die();
    }
	
	function read_current_floor($dbConn)
	{
		echo "HELLO";
		//$dbConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$test = $dbConn->query('SELECT currentFloor FROM cFloor_table');
	    var_dump($test);
		//echo $test;
		return 0; //$test; //$rows;
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
			$currentFloor = read_current_floor($dbConn);
		    //$curr_floor_query = $dbConn->query('SELECT requestedFloor FROM cFloor_table');
		    //$currentFloor = $curr_floor_query->fetch(PDO::FETCH_ASSOC);
			
			//echo $currentFloor;
			
		    $params = [
		        'requestedFloor' => $requestedFloor,
		        'controllerType' => $controllerType,
		        'doorState' => $doorState,
		        'currentFloor' => $currentFloor,
		        'dateID' => $curr_date['CURRENT_DATE()'],
		        'timeID' => $curr_time['CURRENT_TIME()']
		    ];
		   
		    if(!($statement->execute($params)))
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
	
	function CAN_network_write($dbConn, $requestedFloor, $doorState)
	{		
	    try
	    {
	    	$query = 'INSERT INTO CAN_network(CAN_ID, requestedFloor, doorState, currentFloor, dateID, timeID) VALUES (100, :requestedFloor, :doorState, :currentFloor, :dateID, :timeID)';
	    	$dbConn->beginTransaction();
		    $statement = $dbConn->prepare($query);
		    $curr_date_query = $dbConn->query('SELECT CURRENT_DATE()');
		    $curr_date = $curr_date_query->fetch(PDO::FETCH_ASSOC);
		    $curr_time_query = $dbConn->query('SELECT CURRENT_TIME()');
		    $curr_time = $curr_time_query->fetch(PDO::FETCH_ASSOC);
			//$curr_floor_query = $dbConn->query('SELECT requestedFloor FROM cFloor_table');
		    $currentFloor = read_current_floor($dbConn);
			echo $currentFloor;
			
		    $params = [
		        'requestedFloor' => $requestedFloor,
		        'doorState' => $doorState,
		        'currentFloor' => $currentFloor,
		        'dateID' => $curr_date['CURRENT_DATE()'],
		        'timeID' => $curr_time['CURRENT_TIME()']
		    ];
		   
		    if(!$statement->execute($params)) 
		    {
		       throw new Exception("CAN_network_write: Error executing statement");
		    }
		    $dbConn->commit();
	    
	    } 
	    catch (Exception $e) 
	    {
	    	$dbConn->rollBack();
	    	echo "Failed: " .$e->getMessage();
	    }

	}
	
	function queue_table_write($dbConn, $requestedFloor, $doorState)
	{
	
	    try
	    {
	    	$query = 'INSERT INTO queue_table(nodeID, requestedFloor, doorState, currentFloor) VALUES (100, :requestedFloor, :doorState, :currentFloor)';
	    	$dbConn->beginTransaction();
		    $statement = $dbConn->prepare($query);
		    //$curr_floor_query = $dbConn->query('SELECT requestedFloor FROM cFloor_table');
		    $currentFloor = read_current_floor($dbConn);

		    $params = [
		        'requestedFloor' => $requestedFloor,
		        'doorState' => $doorState,
		        'currentFloor' => $currrentFloor
		    ];
		   
		    if(!$statement->execute($params)) 
		    {
		       throw new Exception("queue_table_write: Error executing statement");
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
		CAN_network_write($db, $requestedFloor, $doorState);
		queue_table_write($db, $requestedFloor, $doorState);
	}
?>