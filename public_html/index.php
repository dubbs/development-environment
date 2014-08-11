<?php

error_reporting(E_ALL);
ini_set('error_reporting', E_ALL);

$db = new PDO('mysql:host=localhost;dbname=mydb;charset=utf8', 'vagrant', 'password');
$db->query('');
var_dump($db);

?>