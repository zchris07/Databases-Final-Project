<head><title>Prepared Statement #8</title></head>
<body>
<?php
include 'open.php';
// echo "bruh";

if ($result = $conn->query("CALL get8();")) {
        if ($result->num_rows == 0) {
            echo "<p>Empty Set</p>";
        } else {
	  
            echo "<table border=\"2px solid black\">";
            echo "<tr><td>Blue Counties</td>";
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["blue_counties"]."</td>";
                echo "</tr>";
		
            }
        }
    } 
?>
</body>