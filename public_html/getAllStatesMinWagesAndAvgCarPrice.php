<head>
        <title> State minimum wages and average car prices
</title>
</head>
<body>
<?php
    include 'open.php';

    if ($stmt = $conn->prepare("CALL getAllStatesMinWagesAndAvgCarPrice()")) {

        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            if ($result->num_rows == 0) {
                echo "<p>Something has gone terribly wrong</p>";
            } else {
                echo "<table id=\"wage-table\"border=\"2px solid black\">";
                echo "<thead><tr><td>State</td><td>Effective minimum wage</td><td>Average car price</td></thead>";
                echo "<tbody>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["state_name"]."</td>";
                    echo "<td>".$row["effMinWage"]."</td>";
                    echo "<td>".$row["avg_price"]."</td>";
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