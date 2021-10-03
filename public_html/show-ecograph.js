function getEcoTableData() {

    var table = $('#eco-results').contents().find('#eco-table');

    var table_data_map = table.find('tbody tr').map(function () {
        var $row = $(this);
        return {
            make: $row.find(':nth-child(1)').text(),
            model: $row.find(':nth-child(2)').text(),
            price: $row.find(':nth-child(3)').text(),
            tailpipe: $row.find(':nth-child(4)').text()
          };
    })

    table_data = [];
    table_data_map.map((index, row) => {
        table_data.push(row);
    });
    return table_data;

}

function displayEcoChart() {
    var table_data = getEcoTableData();
    var chart_data = [];
    table_data.map((row) => {
        chart_data.push({
            y: parseFloat(row["tailpipe"]),
            label: row["make"],
            indexLabel: row["model"]
        });
    });
    
        //Better to construct options first and then pass it as a parameter

    var options = {
        animationEnabled: true,
        title: {
            text: "Least efficient models by manufacturer (based on CO2 emission)",                
            fontColor: "Peru"
        },	
        axisY: {
            tickThickness: 0,
            lineThickness: 0,
            valueFormatString: " ",
            includeZero: true,
            gridThickness: 0                    
        },
        axisX: {
            tickThickness: 0,
            lineThickness: 0,
            labelFontSize: 18,
            labelFontColor: "Peru"				
        },
        data: [{
            indexLabelFontSize: 14,
            toolTipContent: "<span style=\"color:#62C9C3\">{indexLabel}:</span> <span style=\"color:#CD853F\"><strong>{y}</strong></span>",
            indexLabelPlacement: "inside",
            indexLabelFontColor: "white",
            indexLabelFontWeight: 600,
            indexLabelFontFamily: "Verdana",
            color: "#62C9C3",
            type: "bar",
            dataPoints: chart_data
        }]
    };
    $("#eco-chart").CanvasJSChart(options);
}
