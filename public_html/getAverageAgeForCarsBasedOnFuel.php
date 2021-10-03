<head>
        <title>Average age for cars who use premium fuel</title>
</head>
<body>
<?php
    include 'open.php';

    $fuelType = $_POST['fuelType'];
    if ($stmt = $conn->prepare("CALL getAverageAgeForCarsBasedOnFuel(?)")) {
        
        $stmt->bind_param("s", $fuelType);

        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            
            if ($result->num_rows == 0) {
                echo "<p>No entries for fuel type: $fuelType.</p>";
            } else {
                echo "<table border=\"2px solid black\">";
                echo "<tr><td>Fuel Type</td><td>Average age</td></tr>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["Fuel_Type"]."</td>";
                    echo "<td>".$row["Average_Age"]."</td>";
                    echo "</tr>";
                }
            }
        } else {
            echo "Execute failed. <br>";
        }
    } else {
        echo "Prepare failed.<br>";
    }
?>
</body>