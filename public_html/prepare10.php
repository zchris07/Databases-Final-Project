<head><title>Prepared Statement #10</title></head>
<body>
<?php
include 'open.php';
// echo "bruh";

if ($result = $conn->query("CALL getWages();")) {
        if ($result->num_rows == 0) {
            echo "<p>Empty Set</p>";
        } else {
	  
            echo "<table border=\"2px solid black\">";
            echo "<tr><td>State</td><td>Minimum Wage</td><td>Candidate</td>";
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["state_"]."</td>";
                echo "<td>".$row["effMinWage"]."</td>";
		echo "<td>".$row["candidate"]."</td>";
                echo "</tr>";
		
            }
        }
    } 
?>
</body>