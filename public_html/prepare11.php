<head><title>Prepared Statement #11</title></head>
<body>
<?php
include 'open.php';
// echo "bruh";

if ($result = $conn->query("CALL getFuelCost();")) {
        if ($result->num_rows == 0) {
            echo "<p>Empty Set</p>";
        } else {
	  
            echo "<table border=\"2px solid black\">";
            echo "<tr><td>Fuel Type</td><td>Average Fuel Cost</td>";
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["fuelType"]."</td>";
                echo "<td>".$row["AVG(annualFuelCost)"]."</td>";
                echo "</tr>";
		
            }
        }
    } 
?>
</body>