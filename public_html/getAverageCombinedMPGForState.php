<head>
        <title>Average combined MPG for cars in a state</title>
</head>
<body>
<?php
    include 'open.php';

    $state = $_POST['state'];
    if ($stmt = $conn->prepare("CALL getAverageCombinedMPGForState(?)")) {

        $stmt->bind_param("s", $state);
        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            
            if ($result->num_rows == 0) {
                echo "<p>No entries for state: $state.</p>";
            } else {
                echo "<table border=\"2px solid black\">";
                echo "<tr><td>Average MPG</td></tr>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["avgMPG"]."</td>";
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