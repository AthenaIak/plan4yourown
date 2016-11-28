<?php
$host = 'localhost:3306';
$username = 'root';
$password = 'passwd'; # password not set for some reason!!!
$db_name = 'hackathon_good';

$con = mysql_connect("$host", "$username", "$password")or die("Cannot Connect");
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
$db_selected = mysql_select_db($db_name, $con);
if (!$db_selected) {
    die('can\'t use' . DB_NAME . ': ' . mysql_error());
}
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Plan 4 Your Own</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="theme.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="functionality.js"></script>
    </head>
    <body class="center">
        <div id="header"><a href="index.php"><img class="logo" src="img/plannerlogo.png" alt="Planner logo"/></a></div>
        <h1>Create your own awesome plan!</h1>
        <?php
        session_start();
        $user = $_SESSION['myusername'];
        $query = "SELECT weekly_capacity FROM Students WHERE Username='" . $user . "'";
        $weekly_capacity = mysql_fetch_row(mysql_query($query))[0] or die(mysql_error());

        if ($weekly_capacity > 0) {
            $query = "SELECT Day, StartTime FROM teacheravailability WHERE Week=48";
            $result = mysql_query($query) or die(mysql_error());

            $monday = [];
            $tuesday = [];
            $wednesday = [];
            $thursday = [];
            $friday = [];

            while ($row = mysql_fetch_array($result)) {
                //Print table with details and edit option.
                #read row
                $day = $row[0];
                $start_time = $row[1];
                switch ($day):
                    case 'Monday':
                        array_push($monday, $start_time);
                        break;
                    case 'Tuesday':
                        array_push($tuesday, $start_time);
                        break;
                    case 'Wednesday':
                        array_push($wednesday, $start_time);
                        break;
                    case 'Thursday':
                        array_push($thursday, $start_time);
                        break;
                    case 'Friday':
                        array_push($friday, $start_time);
                        break;
                endswitch;
            }
        }
        #print(print_r($monday) . '<br>' . print_r($tuesday) . '<br>' . print_r($wednesday) . '<br>' . print_r($thursday) . '<br>' . print_r($friday) . '<br>');
        ?>

        <table id="student_planner">
            <col width="10%">
            <col width="18%">
            <col width="18%">
            <col width="18%">
            <col width="18%">
            <col width="18%">
            <tr>
                <th id="time">Time</th>
                <th id="mon">Monday</th>
                <th id="tue">Tuesday</th>
                <th id="wed">Wednesday</th>
                <th id="thu">Thursday</th>
                <th id="fri">Friday</th>
            </tr>
            <tr>
                <td id="time8">8.00-9.00</td>
                <td id="mon8" class="mon timeslot <?php
                if (in_array('8', $monday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="tue8" class="tue timeslot <?php
                if (in_array('8', $tuesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="wed8" class="wed timeslot <?php
                if (in_array('8', $wednesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="thu8" class="thu timeslot <?php
                if (in_array('8', $thursday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="fir8" class="fri timeslot <?php
                if (in_array('8', $friday)) {
                    print('droppable');
                }
                ?>"></td>
            </tr>
            <tr>
                <td id="time9">9.00-10.00</td>
                <td id="mon9" class="mon timeslot <?php
                if (in_array('9', $monday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="tue9" class="tue timeslot <?php
                if (in_array('9', $tuesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="wed9" class="wed timeslot <?php
                if (in_array('9', $wednesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="thu9" class="thu timeslot <?php
                if (in_array('9', $thursday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="fir9" class="fri timeslot <?php
                if (in_array('9', $friday)) {
                    print('droppable');
                }
                ?>"></td>
            </tr>
            <tr>
                <td id="time10">10.00-11.00</td>
                <td id="mon10" class="mon timeslot <?php
                if (in_array('10', $monday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="tue10" class="tue timeslot <?php
                if (in_array('10', $tuesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="wed10" class="wed timeslot <?php
                if (in_array('10', $wednesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="thu10" class="thu timeslot <?php
                if (in_array('10', $thursday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="fir10" class="fri timeslot <?php
                if (in_array('10', $friday)) {
                    print('droppable');
                }
                ?>"></td>
            </tr>
            <tr>
                <td id="time11">11.00-12.00</td>
                <td id="mon11" class="mon timeslot <?php
                if (in_array('11', $monday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="tue11" class="tue timeslot <?php
                if (in_array('11', $tuesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="wed11" class="wed timeslot <?php
                if (in_array('11', $wednesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="thu11" class="thu timeslot <?php
                if (in_array('11', $thursday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="fir11" class="fri timeslot <?php
                if (in_array('11', $friday)) {
                    print('droppable');
                }
                ?>"></td>
            </tr>
            <tr>
                <td id="time12">12.00-13.00</td>
                <td id="mon12" class="mon timeslot <?php
                if (in_array('12', $monday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="tue12" class="tue timeslot <?php
                if (in_array('12', $tuesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="wed12" class="wed timeslot <?php
                if (in_array('12', $wednesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="thu12" class="thu timeslot <?php
                if (in_array('12', $thursday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="fir12" class="fri timeslot <?php
                if (in_array('12', $friday)) {
                    print('droppable');
                }
                ?>"></td>
            </tr>
            <tr>
                <td id="time13">13.00-12.00</td>
                <td id="mon13" class="mon timeslot <?php
                if (in_array('13', $monday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="tue13" class="tue timeslot <?php
                if (in_array('13', $tuesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="wed13" class="wed timeslot <?php
                if (in_array('13', $wednesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="thu13" class="thu timeslot <?php
                if (in_array('13', $thursday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="fir13" class="fri timeslot <?php
                if (in_array('13', $friday)) {
                    print('droppable');
                }
                ?>"></td>
            </tr>
            <tr>
                <td id="time14">14.00-15.00</td>
                <td id="mon14" class="mon timeslot <?php
                if (in_array('14', $monday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="tue14" class="tue timeslot <?php
                if (in_array('14', $tuesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="wed14" class="wed timeslot <?php
                if (in_array('14', $wednesday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="thu14" class="thu timeslot <?php
                if (in_array('14', $thursday)) {
                    print('droppable');
                }
                ?>"></td>
                <td id="fir14" class="fri timeslot <?php
                if (in_array('14', $friday)) {
                    print('droppable');
                }
                ?>"></td>
            </tr>
            <tr class="noBorder">
                <td>TODO tasks</td>
                <?php
                if ($weekly_capacity > 0) {
                    $min = floor($weekly_capacity / 5);
                    $days_max = $weekly_capacity % 5;
                    $daily_points = [$min, $min, $min, $min, $min];
                    for ($i = 0; $i < $days_max; $i++) {
                        $daily_points[$i] = $min + 1;
                    }
                }

                $query = "SELECT * FROM assignments LIMIT $weekly_capacity";
                $assignments_result = mysql_query($query) or die(mysql_error());

                $ids = [];
                $names = [];
                $urls = [];

                while ($row = mysql_fetch_array($assignments_result)) {
                    #save the names of the courses
                    array_push($names, $row[0]);
                    array_push($ids, $row[2]);
                    array_push($urls, $row[7]);
                }

                $counter = 0;
                print('<td class="mon tasks droppable">');
                for ($i = 0; $i < $daily_points[0]; $i++) {
                    print('<div class = "block_1h draggable" id = "' . $ids[$counter] . '"><a href="' . $urls[$counter] . '">' . $names[$counter] . '</a></div>');
                    $counter++;
                }
                print('</td>');

                print('<td class="tue tasks droppable">');
                for ($i = 0; $i < $daily_points[1]; $i++) {
                    print('<div class = "block_1h draggable" id = "' . $ids[$counter] . '"><a href="' . $urls[$counter] . '">' . $names[$counter] . '</a></div>');
                    $counter++;
                }
                print('</td>');

                print('<td class="wed tasks droppable">');
                for ($i = 0; $i < $daily_points[2]; $i++) {
                    print('<div class = "block_1h draggable" id = "' . $ids[$counter] . '"><a href="' . $urls[$counter] . '">' . $names[$counter] . '</a></div>');
                    $counter++;
                }
                print('</td>');

                print('<td class="thu tasks droppable">');
                for ($i = 0; $i < $daily_points[3]; $i++) {
                    print('<div class = "block_1h draggable" id = "' . $ids[$counter] . '"><a href="' . $urls[$counter] . '">' . $names[$counter] . '</a></div>');
                    $counter++;
                }
                print('</td>');

                print('<td class="fri tasks droppable">');
                for ($i = 0; $i < $daily_points[4]; $i++) {
                    print('<div class = "block_1h draggable" id = "' . $ids[$counter] . '"><a href="' . $urls[$counter] . '">' . $names[$counter] . '</a></div>');
                    $counter++;
                }
                print('</td>');
                ?>
            </tr>
        </table>

        <table style="float:right"><tr><td>
                    <div id="show" ><button id="submit_plan" type="button">Submit plan!</button></div></td><tr><td>
                    <div id="hide" style="color:green;float:right">Plan saved! (not really)</div>
                </td></tr>
        </table>
    </body>
</html>
