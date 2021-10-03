<head>
        <title>Get max CO2 emissions for vehicle manufacturers</title>
</head>
<body>
<?php
    include 'open.php';

    if ($stmt = $conn->prepare("CALL getMaxCO2VehicleForManufacturers()")) {

        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            if ($result->num_rows == 0) {
                echo "<p>Something has gone terribly wrong</p>";
            } else {
                echo "<table id=\"eco-table\" border=\"2px solid black\">";
                echo "<thead><tr><td>Make</td><td>Model</td><td>Price</td><td>TailpipeCO2</td></thead>";
                echo "<tbody>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["make"]."</td>";
                    echo "<td>".$row["model"]."</td>";
                    echo "<td>".$row["price"]."</td>";
                    echo "<td>".$row["tailCO2"]."</td>";
                    echo "</tr>";
                }
                echo "</tbody>";
            }
        } else {
            echo "Execute failed. <br>";
        }
    } else {
        echo "Prepare failed.<br>";
    }
?>
</body>