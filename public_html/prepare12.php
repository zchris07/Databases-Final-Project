<head><title>Prepared Statement #12</title></head>
<body>
<?php
include 'open.php';
// echo "bruh";

if ($result = $conn->query("CALL getAvgListingPrice();")) {
        if ($result->num_rows == 0) {
            echo "<p>Empty Set</p>";
        } else {
	  
            echo "<table id=\"pricetrends-table\" border=\"2px solid black\">";
            echo "<thead><tr><td>Year</td><td>Average Price</td></thead>";
            echo "<tbody>";
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["year_"]."</td>";
                echo "<td>".$row["AVG(price)"]."</td>";
                echo "</tr>";
            }
            echo "</tbody>";
        }
    } 
?>
</body>