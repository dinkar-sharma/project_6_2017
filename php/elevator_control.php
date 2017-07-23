<?php 
    session_start();
    $q = $_POST['']

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
 ?>