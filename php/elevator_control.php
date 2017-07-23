<?php 
    session_start();
    
    function write_to_elevator_network($db)
    {
        $query = 'INSERT INTO elevator_network(date, time, requestFloor, doorState, currentFloor)
        VALUES (:date, :time, :requestFloor, :doorState, :currentFloor)';
        $statement = $db->prepare($query);
        $currentDateQuery = $db->query('SELECT CURRENT_DATE()');
        $currentTimeQuery = $db->query('SELECT CURRENT_TIME()');
        $currentFloor = 1;
        $requestFloor = $_POST['floorRequest'];
        $doorState = "open";

        $params = [
            'date' => $currentDateQuery['CURRENT_DATE()'],
            'time' => $currentTimeQuery['CURRENT_TIME()'],
            'requestFloor' => $requestFloor,
            'doorState' => $doorState,
            'currentFloor' => $currentFloor;
        ]

        if(!$statement->execute($params))
        {
            echo "DONE GOOFED";
        }
    }

    if(!isset($_SESSION['username']))
    {
        echo "HELLOOOOO";
        header("Location: ../index.html"); 
        die();
    }

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

    result = write_to_elevator_network($dbPDO);
 ?>