<head>
        <title>Find hours</title>
</head>
<body>
<?php
    include 'open.php';
    // echo "bruh";
    $state = $_POST['state'];
    if ($result = $conn->query("CALL getHours('".$state."');")) {
        if ($result->num_rows == 0) {
            echo "<p>No entries for state: $state.</p>";
        } else {
            echo "<table border=\"2px solid black\">";
            echo "<tr><td>Hours of Labor</td>";
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["mp / effMinWage"]."</td>";
                echo "</tr>";
            }
        }
    }
?>
</body>