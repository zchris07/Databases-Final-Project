<head>
        <title>Average price for a given make</title>
</head>
<body>
<?php
    include 'open.php';

    $make = $_POST['make'];
    if ($stmt = $conn->prepare("CALL getAveragePriceForMake(?)")) {

        $stmt->bind_param("s", $make);
        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            
            if ($result->num_rows == 0) {
                echo "<p>No entries for make: $make.</p>";
            } else {
                echo "<table border=\"2px solid black\">";
                echo "<tr><td>Make</td><td>Average price</td></tr>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["make"]."</td>";
                    echo "<td>".$row["average_price"]."</td>";
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