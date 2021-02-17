<?php
      // verbinding maken met de database

      $server = "localhost";
      $user = "root";
      $password = "";
      $database = "refuzioninc";

      $conn = mysqli_connect($server, $user, $password, $database)
      or die ("Er kan geen verbinding tot stand worden gebracht: " .
      mysqli_connect_error());

      $s= mysqli_query($conn,"select * from action")
?>
<!DOCTYPE html>
<html lang="nl">
     <head>
           <title>Marker toevoegen</title>
           <meta charset="utf-8">
     </head>
     <body>
     <body>
           <form name="toevoegen" action="verwerk.php" method="post">
                 <fieldset>
                 <legend>Toevoegen Marker</legend>
                 <table>
                       <tr>
                             <td align="right">Naam:</td> <td><input type="text" name="name" size="25"></td>
                       </tr>
                       <tr>
                             <td align="right">Description:</td> <td><input type="text" name="description" size="25"></td>
                       </tr>
                       <tr>
                             <td align="right">Latitude:</td> <td><input type="text" name="lat" size="10"></td>
                       </tr>
                       <tr>
                             <td align="right">Longitude:</td> <td><input type="text" name="lng" size="10"></td>
                       </tr>
                       <tr>
                             <td align="right">Action:</td> <td>
                                    <select name="action_id" size="1">
                                    <?php
                                          while($r = mysqli_fetch_array($s)) {
                                                ?>
                                                <option value=<?php echo $r['id']; ?>><?php echo $r['name']; ?></option>
                                          <?php
                                          }
                                          ?>
                                    </select>
                              </td>
                       </tr>
                       <tr>
                       <tr>
                            <td><input type="submit" value="Voeg marker toe"></td>
                       <td><input type="reset" value="Wis gegevens"></td>
                       </tr>
                 </table>
                 </fieldset>
           </form>
     </body>
</html>