<head>
        <title>Listings for state</title>
</head>
<body>
<?php
    include 'open.php';

    $state = $_POST['state'];
    if ($stmt = $conn->prepare("CALL getListingsAndModelsForState(?)")) {

        $stmt->bind_param("s", $state);
        if ($stmt->execute()) {
            
            $result = $stmt->get_result();
            
            if ($result->num_rows == 0) {
                echo "<p>No entries for state: $state.</p>";
            } else {
                echo "<table border=\"2px solid black\">";
                echo "<tr><td>Model</td><td>URL</td>";
                foreach($result as $row) {
                    echo "<tr>";
                    echo "<td>".$row["model"]."</td>";
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