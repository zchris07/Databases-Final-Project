<head>
        <title>Get the average highway mpg of the cars listed in every state that has a minimum wage above $10</title>
</head>
<body>
<?php
    include 'open.php';

    if ($stmt = $conn->prepare("CALL getAverageHighwayMPGForMinWage()")) {

        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            if ($result->num_rows == 0) {
                echo "<p>Something has gone terribly wrong</p>";
            } else {
                echo "<table border=\"2px solid black\">";
                echo "<tr><td>Make</td><td>Model</td><td>Average Highway MPG</td><td>URL</td>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["make"]."</td>";
                    echo "<td>".$row["model"]."</td>";
                    echo "<td>".$row["averagehighwaympg"]."</td>";
                    echo "<td>".$row["url"]."</td>";
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