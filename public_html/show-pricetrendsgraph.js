function getPriceTrendsTableData() {

    var table = $('#pricetrends-results').contents().find('#pricetrends-table');

    var table_data_map = table.find('tbody tr').map(function () {
        var $row = $(this);
        return {
            year: $row.find(':nth-child(1)').text(),
            averagePrice: $row.find(':nth-child(2)').text()
          };
    })

    table_data = [];
    table_data_map.map((index, row) => {
        table_data.push(row);
    });
    return table_data;
}

function displayPriceTrendsChart() {

    var table_data = getPriceTrendsTableData();
    var chart_data = [];
    table_data.map((row) => {
        chart_data.push({
            x: parseFloat(row["year"]),
            y: parseFloat(row["averagePrice"])
        });
    });

    var options = {
        animationEnabled: true,  
        title:{
            text: "Listing prices over time"
        },
        axisX: {
            title: "year"
        },
        axisY: {
            title: "Price (USD)",
            prefix: "$"
        },
        data: [{
            type: "line",
            dataPoints: chart_data
        }]
    };

    $("#pricetrends-chart").CanvasJSChart(options);
}
