<?php 
    session_start();
    if(!isset($_SESSION['username']))
    {
        header("Location: ../index.html"); 
        die();
    }
 ?>
<!DOCTYPE html>
<html>
<head>
    <title>Elevator Control</title>
    <meta charset="utf-8">
    <meta content="" name="decription">
    <meta content="Group DAM" http-equiv="author">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <!-- Latest compiled and minified CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel=
    "stylesheet"><!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script><!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
    </script>
    <script src="../js/elevator_control.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/navbar.css">
    <link rel="stylesheet" type="text/css" href="../css/elevator_control.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-target="#myNavbar" data-toggle="collapse" type=
                    "button"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class=
                    "icon-bar"></span></button> <a class="navbar-brand" href="../index.html">DAM Elevator</a>
                </div>
                <div id="myNavbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="../about.html">About</a></li>
                        <li><a href="../project_details.html">Project Details</a></li>
                        <li><a href="../project_plan.html">Project Plan</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">LogBooks<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../logbook/dinkar-logbook.html">Dinkar</a></li>
                                <li class="divider"></li>
                                <li><a href="../logbook/anas-logbook.html">Anas</a></li>
                                <li class="divider"></li>
                                <li><a href="../logbook/mike-logbook.html">Mike</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a><span id="welcome" class="glyphicon glyphicon-user"></span> <?php echo $_SESSION['username']; ?></a>
                        </li>
                        <li>
                            <a href="logout.php"> <span class="glyphicon glyphicon-log-out"></span> Log out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <form method="post" action="elevator_control.php">
        <div id="elevator-controller" class="col-sm-6 bg-grey-light text-center">
            <h2>Elevator Controller</h2>
            <div id="controller-btn" class="btn-group-vertical">
                <button name="car-3-req" class="btn btn-primary btn-lg" type="submit">3</button>
                <button name="car-2-req" class="btn btn-primary btn-lg" type="submit">2</button>
                <button name="car-1-req" class="btn btn-primary btn-lg" type="submit">1</button>
                <div id="door-state-btn" class="btn-group btn-group-justified">
                    <div class="btn-group">
                        <button name="door-open" type="submit" class="btn btn-primary">Open</button>
                    </div>
                    <div class="btn-group">
                        <button name="door-close" type="submit" class="btn btn-primary">Close</button>
                    </div>
                </div>
            </div>
<!--             <div class="floor-req-light">
                <span id="floor-3-light" class="floor-light"></span>
                <span id="floor-2-light" class="floor-light"></span>
                <span id="floor-1-light" class="floor-light"></span>
                <span id="door-open-light" class="floor-light"></span>
                <span id="door-close-light" class="floor-light"></span>
            </div>   -->
        </div>
        <div id="car-controller" class="col-sm-6 bg-grey-light text-center">
            <h2>Floor Controller</h2>
            <div id="controller-btn" class="btn-group-vertical">
                <button name="floor-3-req" class="btn btn-primary btn-lg" type="submit">3</button>
                <button name="floor-2-req" class="btn btn-primary btn-lg" type="submit">2</button>
                <button name="floor-1-req" class="btn btn-primary btn-lg" type="submit">1</button>
            </div>
<!--             <div class="floor-req-light">
                <span id="floor-3-light" class="floor-light"></span>
                <span id="floor-2-light" class="floor-light"></span>
                <span id="floor-1-light" class="floor-light"></span>
                <span id="floor-1-light" class="floor-light"></span>
                <span id="floor-1-light" class="floor-light"></span>
            </div> -->
        </div>
        <script src="../js/elevator_control.js"></script>
    </form>
    <section class="bg-grey-dark">
        <div id="debug-content" class="col-sm-12 bg-grey-dark text-center">
          <!--   <h2>Debug-Panel</h2> -->
            <div class=table-responsive>
                <table id="elevator-network-table" class=table>
                <thead>
                <h2>Debug-Panel</h2>
                    <tr>
                        <th>Node ID</th>
                        <th>Floor Request</th>
                        <th>Controller Type</th>
                        <th>Door State</th>
                        <th>Current Floor</th>
                        <th>Date</th>
                        <th>Time</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        function elevator_network_display($dbConn)
                        {
                            $query = 'SELECT * FROM 
                                    (SELECT * FROM elevator_network ORDER BY timeID DESC LIMIT 10)
                                    sub ORDER BY timeID ASC';
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

                        function elevator_network_write($dbConn, $requestFloor, $doorState, $controllerType)
                        {

                            $query = 'INSERT INTO elevator_network(nodeID, requestedFloor, controllerType, doorState, currentFloor, dateID, timeID) VALUES (100, :requestedFloor, :controllerType, :doorState, :currentFloor, :dateID, :timeID)';

                            $statement = $dbConn->prepare($query);
                            $curr_date_query = $dbConn->query('SELECT CURRENT_DATE()');
                            $curr_date = $curr_date_query->fetch(PDO::FETCH_ASSOC);
                            $curr_time_query = $dbConn->query('SELECT CURRENT_TIME()');
                            $curr_time = $curr_time_query->fetch(PDO::FETCH_ASSOC);
                            $currentFloor = $_POST['currentFloor'] ?? '';

                            $params = [
                                'requestedFloor' => $requestFloor,
                                'controllerType' => $controllerType,
                                'doorState' => $doorState,
                                'currentFloor' => $currentFloor,
                                'dateID' => $curr_date['CURRENT_DATE()'],
                                'timeID' => $curr_time['CURRENT_TIME()']
                            ];

                            $result = $statement->execute($params);

                            if(!$result)
                            {
                                echo "Error executing statement";
                            }
                        }
                        $doorState = "";
                        $requestFloor = "";
                        $controllerType = '';

                        if (isset($_POST["floor-1-req"])) 
                        {
                            $requestFloor = 1;
                            $controllerType = "FC";
                        }
                        else if (isset($_POST["floor-2-req"])) 
                        {
                            $requestFloor = 2;
                            $controllerType = "FC";
                        }
                        else if (isset($_POST["floor-3-req"])) 
                        {
                            $requestFloor = 3;
                            $controllerType = "FC";
                        }

                        else if (isset($_POST["car-1-req"])) 
                        {
                            $requestFloor = 1;
                            $controllerType = "EC";
                        }
                        else if (isset($_POST["car-2-req"])) 
                        {
                            $requestFloor = 2;
                            $controllerType = "EC";
                        }
                        else if (isset($_POST["car-3-req"])) 
                        {
                            $requestFloor = 3;
                            $controllerType = "EC";
                        }

                        else if (isset($_POST["door-open"])) 
                        {
                            $doorState = "open";
                        }
                        else if (isset($_POST["door-close"])) 
                        {
                            $doorState = "close";
                        }
                        else
                        {
                            $doorState = "na";
                            $requestFloor = "none";
                            $controllerType = 'na';
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

                        if($requestFloor != 'none')
                        {
                           elevator_network_write($db, $requestFloor, $doorState, $controllerType);
                        }
                        elevator_network_display($db);
                    ?>
               </tbody>
            </table>
            <div class="table-responsive">
                <table id="members-table" class="table">
                    <thead>
                        <!-- <h2>Members</h2> -->
                        <tr>
                            <th>User ID</th>
                            <th>Username</th>
                            <th>Password</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            function authorized_users_display($dbConn)
                            {
                                $query = 'SELECT * FROM 
                                        (SELECT * FROM authorized_users ORDER BY userID DESC LIMIT 10)
                                        sub ORDER BY userID ASC';
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

                            authorized_users_display($db);
                         ?>
                    </tbody>
                </table>
        </div>
        <ul class="pagination">
            <li><a id="elevator-network" href="#" onclick="displayElevatorNetwork(); return false;">1</a></li>
            <li><a id="members" href="#" onclick="displayMembers(); return false;">2</a></li>
            <li><a href="#">3</a></li>
        </ul>
    </section>
    <footer id="foot" class="col-sm-12 text-center"><script src="../js/common.js"></script></footer>
</body>
</html>