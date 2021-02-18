<?php

     // verbinding maken met de database

     $server = "localhost";
     $user = "root";
     $password = "";
     $database = "refuzioninc";

     $conn = mysqli_connect($server, $user, $password, $database)
     or die ("Er kan geen verbinding tot stand worden gebracht: " .
     mysqli_connect_error());

     // Ophalen van gegevens uit het formulier

     $name = $_POST["name"];
     $desc = $_POST["description"];
     $lat = $_POST["lat"];
     $lng = $_POST["lng"];
     $action = $_POST["action_id"];

// if $naam ==== sendertable.name { }
// haal op id op en controleer of het het zelfde is
     $sql = "SELECT * FROM `sender` WHERE `id` = $id";    // get information by name query


     // $naam vergelijken met sender tabel --- staat deze naam in het sender tabel, dan pak ik het id op en stop ik hem in point of intrest bij de rest
     $sql1 = "IF name EXISTS ( SELECT * FROM `sender` WHERE name = $naam ) ELSE ( INSERT INSERT INTO `poi`(`sender_id`, `description`, `lat`, `lng`, `action_id`, `date`) VALUES ($name, $desc, $lat, $lng, $action, CURRENT_TIMESTAMP)"; // if name exists check. sql

     

     
     // staat hij niet in de tabel, dan voeg ik de naam toe aan sender en vervolgens daarvan de inser id opvragen
     
     
     // en daarna wegschrijven in point off intrest








     // Invoegen van de gegevens in de tabel provincies

     $query = "INSERT INTO poi(description,lat,lng,action_id,date)
     VALUES('','','$desc','$lat','$lng','$action','NOW')";
     $query2 = "INSERT INTO sender(name) VALUES('$naam')";
     $resultaat = mysqli_query($conn, $query);
     $resultaat2 = mysqli_query($conn, $query2);

     // Verbreken van de verbinding met de database

     $verbreken = mysqli_close($conn);

     // Bevestigen dat de gegevens zijn opgeslagen

     echo "De gegevens van $naam zijn opgeslagen in de database." . "<br>" . "<a href='index.html'>home</a>";
?>