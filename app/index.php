<?php 
echo "Hello World";
include_once('db.php');

try {
    $dbh = new PDO("mysql:host=$hostname;dbname=$dbname;port=$port", $user, $pass);
    foreach($dbh->query('SELECT * from FOO') as $row) {
        print_r($row);
    }
    $dbh = null;
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>
