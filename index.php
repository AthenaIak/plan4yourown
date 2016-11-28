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
#echo 'Connected Successfully';

class someClass {

    // Login function
    function checkLogin() {
        // username and password sent from form
        $myusername = filter_input(INPUT_POST, 'myusername');
        $mypassword = filter_input(INPUT_POST, 'mypassword') ;       
        #$myusername = $_POST['myusername'];
        #$mypassword = $_POST['mypassword'];

        $sql = "SELECT * FROM students WHERE username='$myusername' and password='$mypassword'";
        $result = mysql_query($sql);

        // Mysql_num_row is counting table row
        $count = mysql_num_rows($result);
        session_start();

        // If result matched $myusername and $mypassword, table row must be 1 row
        if ($count == 1) {
            $_SESSION['myusername'] = $myusername;
            $_SESSION['mypassword'] = $mypassword;
            if ($myusername == "Admin" or $myusername == "admin") {
                print('<meta HTTP-EQUIV="REFRESH" content="0; url=PlannerAdmin.php">');
            } else {
                print('<meta HTTP-EQUIV="REFRESH" content="0; url=Planner.php">');
            }
        } else {
            if ($mypassword != "") {
                print("<h3 style='color:red'>Wrong username or password!</h3>");
            }
        }
    }

}

$x = new someClass;
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
        <div id="content">
            <h1>Welcome to your personal planner!</h1>
            <p>This is an awesome tool that allows you to view and adjust your school work to your preferences!</p>
        </div>
        <div id="menu">
            <?php
            print('<h1>Student login</h1><form name="Login"  method="post" action="' . $x->checkLogin() . '">
                <table>
                    <tr><td>Username:</td></tr>
                    <tr><td><input type="text" id="myusername" name="myusername"></td></tr>
                    <tr><td>Password:</td></tr>
                    <tr><td><input type="password" id="mypassword" name="mypassword"></td></tr>
                    <tr><td><input type="submit" value="Login" name="Login"></td></tr>
                </table>
            </form>');
            ?>
        </div>
    </body>
</html>