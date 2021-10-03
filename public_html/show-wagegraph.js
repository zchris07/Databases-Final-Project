var getWageTableData = function () {
    var table = $('#wage-carprice-results').contents().find('#wage-table');
    console.log("found table");
    console.log(table);
    var table_data_map = table.find('tbody tr').map(function () {
        var $row = $(this);
        return {
            stateName: $row.find(':nth-child(1)').text(),
            effMinWage: $row.find(':nth-child(2)').text(),
            avgCarPrice: $row.find(':nth-child(3)').text(),
          };
    })

    table_data = [];
    table_data_map.map((index, row) => {
        table_data.push(row);
    });
    return table_data;
}

var displayWageCharts = function () {

    var table_data = getWageTableData();

    console.log(table_data);

    var chart1_data = [];
    var chart2_data = [];
    
    table_data.map((row) => {
        chart1_data.push({
            indexLabel: row["stateName"],
            y: parseFloat(row["effMinWage"]),
        });
    });

    table_data.map((row) => {
        chart2_data.push({
            indexLabel: row["stateName"],
            y: parseFloat(row["avgCarPrice"]),
        });
    });


    //Better to construct options first and then pass it as a parameter
    var options1 = {
        title: {
            text: "US Minimum Wages by State"             
        },
        dataPointWidth: 15 ,
        data: [              
        {
            // Change type to "doughnut", "line", "splineArea", etc.
            type: "column",
            dataPoints: chart1_data
        }
        ]
    };

    var options2 = {
        title: {
            text: "Average Car Prices by State"             
        },
        dataPointWidth: 15 ,
        data: [              
        {
            // Change type to "doughnut", "line", "splineArea", etc.
            type: "column",
            dataPoints: chart2_data
        }
        ]
    };
    
$("#wage-chart").CanvasJSChart(options1);
$("#carprice-chart").CanvasJSChart(options2);
}