<head><title>Prepared Statement #9</title></head>
<body>
<?php
include 'open.php';
// echo "bruh";

if ($result = $conn->query("CALL getCountiesWithChevies();")) {
        if ($result->num_rows == 0) {
            echo "<p>Empty Set</p>";
        } else {
	  
            echo "<table border=\"2px solid black\">";
            echo "<tr><td>State</td><td>County</td>";
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["state_"]."</td>";
                echo "<td>".$row["county"]."</td>";
                echo "</tr>";
		
            }
        }
    } 
?>
</body>