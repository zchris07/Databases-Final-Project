<head>
        <title>Information about Japanese cars and Biden votes
</title>
</head>
<body>
<?php
    include 'open.php';

    if ($stmt = $conn->prepare("CALL getJapaneseCarsAndBidenCounties()")) {

        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            if ($result->num_rows == 0) {
                echo "<p>Something has gone terribly wrong</p>";
            } else {
                echo "<table border=\"2px solid black\">";
                echo "<tr><td>Number of counties</td>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["blue_counties"]."</td>";
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