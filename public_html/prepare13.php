<head><title>Prepared Statement #13</title></head>
<body>
<?php
include 'open.php';
// echo "bruh";

if ($result = $conn->query("CALL getMostExpensive();")) {
        if ($result->num_rows == 0) {
            echo "<p>Empty Set</p>";
        } else {
	  
            echo "<table border=\"2px solid black\">";
            echo "<tr><td>Price</td><td>Make</td><td>Model</td><td>Year</td><td>URL</td>";
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["price"]."</td>";
                echo "<td>".$row["make"]."</td>";
                echo "<td>".$row["model"]."</td>";
		        echo "<td>".$row["year_"]."</td>";
                echo "<td>".$row["url"]."</td>";
                echo "</tr>";
		
            }
        }
    } 
?>
</body>