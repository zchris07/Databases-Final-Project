$(document).ready(function() {
    
	$('#listings-map').usmap({
	    'click' : function(event, data) {
            let state_clicked;
            switch (data.name) {
                case 'AL':
                    state_clicked = 'Alabama';
                    break;
                case 'AK':
                    state_clicked = 'Alaska';
                    break;
                case 'AZ':
                    state_clicked = 'Arizona';
                    break;
                case 'AR':
                    state_clicked = 'Arkansas';
                    break;
                case 'CA':
                    state_clicked = 'California';
                    break;
                case 'CO':
                    state_clicked = 'Colorado';
                    break;
                case 'CT':
                    state_clicked = 'Connecticut';
                    break;
                case 'DE':
                    state_clicked = 'Delaware';
                    break;
                case 'FL':
                    state_clicked = 'Florida';
                    break;
                case 'GA':
                    state_clicked = 'Georgia';
                    break;
                case 'HI':
                    state_clicked = 'Hawaii';
                    break;
                case 'ID':
                    state_clicked = 'Idaho';
                    break;
                case 'IL':
                    state_clicked = 'Illinois';
                    break;
                case 'IN':
                    state_clicked = 'Indiana';
                    break;
                case 'IA':
                    state_clicked = 'Iowa';
                    break;
                case 'KS':
                    state_clicked = 'Kansas';
                    break;
                case 'KY':
                    state_clicked = 'Kentucky';
                    break;
                case 'LA':
                    state_clicked = 'Louisiana';
                    break;
                case 'ME':
                    state_clicked = 'Maine';
                    break;
                case 'MD':
                    state_clicked = 'Maryland';
                    break;
                case 'MA':
                    state_clicked = 'Massachusetts';
                    break;
                case 'MI':
                    state_clicked = 'Michigan';
                    break;
                case 'MN':
                    state_clicked = 'Minnesota';
                    break;
                case 'MS':
                    state_clicked = 'Mississippi';
                    break;
                case 'MO':
                    state_clicked = 'Missouri';
                    break;
                case 'MT':
                    state_clicked = 'Montana';
                    break;
                case 'NE':
                    state_clicked = 'Nebraska';
                    break;
                case 'NV':
                    state_clicked = 'Nevada';
                    break;
                case 'NH':
                    state_clicked = 'New Hampshire';
                    break;
                case 'NJ':
                    state_clicked = 'New Jersey';
                    break;
                case 'NM':
                    state_clicked = 'New Mexico';
                    break;
                case 'NY':
                    state_clicked = 'New York';
                    break;
                case 'NC':
                    state_clicked = 'North Carolina';
                    break;
                case 'ND':
                    state_clicked = 'North Dakota';
                    break;
                case 'OH':
                    state_clicked = 'Ohio';
                    break;
                case 'OK':
                    state_clicked = 'Oklahoma';
                    break;
                case 'OR':
                    state_clicked = 'Oregon';
                    break;
                case 'PA':
                    state_clicked = 'Pennsylvania';
                    break;
                case 'RI':
                    state_clicked = 'Rhode Island';
                    break;
                case 'SC':
                    state_clicked = 'South Carolina';
                    break;
                case 'SD':
                    state_clicked = 'South Dakota';
                    break;
                case 'TN':
                    state_clicked = 'Tennessee';
                    break;
                case 'TX':
                    state_clicked = 'Texas';
                    break;
                case 'UT':
                    state_clicked = 'Utah';
                    break;
                case 'VT':
                    state_clicked = 'Vermont';
                    break;
                case 'VA':
                    state_clicked = 'Virginia';
                    break;
                case 'WA':
                    state_clicked = 'Washington';
                    break;
                case 'WV':
                    state_clicked = 'West Virginia';
                    break;
                case 'WI':
                    state_clicked = 'Wisconsin';
                    break;
                case 'WY':
                    state_clicked = 'Wyoming';
                    break;
            }
            $('#alert')
                .text('Click '+state_clicked+' on map 1')
                .stop()
                .css('backgroundColor', '#ff0')
                .animate({backgroundColor: '#ddd'}, 1000);
            $('#listings-state-input')
                .val(state_clicked);
            document.listings.submit();
	    }
    });

	$('#mpg-map').usmap({
	    'click' : function(event, data) {
            let state_clicked;
            switch (data.name) {
                case 'AL':
                    state_clicked = 'Alabama';
                    break;
                case 'AK':
                    state_clicked = 'Alaska';
                    break;
                case 'AZ':
                    state_clicked = 'Arizona';
                    break;
                case 'AR':
                    state_clicked = 'Arkansas';
                    break;
                case 'CA':
                    state_clicked = 'California';
                    break;
                case 'CO':
                    state_clicked = 'Colorado';
                    break;
                case 'CT':
                    state_clicked = 'Connecticut';
                    break;
                case 'DE':
                    state_clicked = 'Delaware';
                    break;
                case 'FL':
                    state_clicked = 'Florida';
                    break;
                case 'GA':
                    state_clicked = 'Georgia';
                    break;
                case 'HI':
                    state_clicked = 'Hawaii';
                    break;
                case 'ID':
                    state_clicked = 'Idaho';
                    break;
                case 'IL':
                    state_clicked = 'Illinois';
                    break;
                case 'IN':
                    state_clicked = 'Indiana';
                    break;
                case 'IA':
                    state_clicked = 'Iowa';
                    break;
                case 'KS':
                    state_clicked = 'Kansas';
                    break;
                case 'KY':
                    state_clicked = 'Kentucky';
                    break;
                case 'LA':
                    state_clicked = 'Louisiana';
                    break;
                case 'ME':
                    state_clicked = 'Maine';
                    break;
                case 'MD':
                    state_clicked = 'Maryland';
                    break;
                case 'MA':
                    state_clicked = 'Massachusetts';
                    break;
                case 'MI':
                    state_clicked = 'Michigan';
                    break;
                case 'MN':
                    state_clicked = 'Minnesota';
                    break;
                case 'MS':
                    state_clicked = 'Mississippi';
                    break;
                case 'MO':
                    state_clicked = 'Missouri';
                    break;
                case 'MT':
                    state_clicked = 'Montana';
                    break;
                case 'NE':
                    state_clicked = 'Nebraska';
                    break;
                case 'NV':
                    state_clicked = 'Nevada';
                    break;
                case 'NH':
                    state_clicked = 'New Hampshire';
                    break;
                case 'NJ':
                    state_clicked = 'New Jersey';
                    break;
                case 'NM':
                    state_clicked = 'New Mexico';
                    break;
                case 'NY':
                    state_clicked = 'New York';
                    break;
                case 'NC':
                    state_clicked = 'North Carolina';
                    break;
                case 'ND':
                    state_clicked = 'North Dakota';
                    break;
                case 'OH':
                    state_clicked = 'Ohio';
                    break;
                case 'OK':
                    state_clicked = 'Oklahoma';
                    break;
                case 'OR':
                    state_clicked = 'Oregon';
                    break;
                case 'PA':
                    state_clicked = 'Pennsylvania';
                    break;
                case 'RI':
                    state_clicked = 'Rhode Island';
                    break;
                case 'SC':
                    state_clicked = 'South Carolina';
                    break;
                case 'SD':
                    state_clicked = 'South Dakota';
                    break;
                case 'TN':
                    state_clicked = 'Tennessee';
                    break;
                case 'TX':
                    state_clicked = 'Texas';
                    break;
                case 'UT':
                    state_clicked = 'Utah';
                    break;
                case 'VT':
                    state_clicked = 'Vermont';
                    break;
                case 'VA':
                    state_clicked = 'Virginia';
                    break;
                case 'WA':
                    state_clicked = 'Washington';
                    break;
                case 'WV':
                    state_clicked = 'West Virginia';
                    break;
                case 'WI':
                    state_clicked = 'Wisconsin';
                    break;
                case 'WY':
                    state_clicked = 'Wyoming';
                    break;
            }
            $('#alert')
                .text('Click '+state_clicked+' on map 1')
                .stop()
                .css('backgroundColor', '#ff0')
                .animate({backgroundColor: '#ddd'}, 1000);
            $('#mpg-state-input')
                .val(state_clicked);
            document.averagempg.submit();
	    }
    });

	$('#hours-to-buy-map').usmap({
	    'click' : function(event, data) {
            let state_clicked;
            switch (data.name) {
                case 'AL':
                    state_clicked = 'Alabama';
                    break;
                case 'AK':
                    state_clicked = 'Alaska';
                    break;
                case 'AZ':
                    state_clicked = 'Arizona';
                    break;
                case 'AR':
                    state_clicked = 'Arkansas';
                    break;
                case 'CA':
                    state_clicked = 'California';
                    break;
                case 'CO':
                    state_clicked = 'Colorado';
                    break;
                case 'CT':
                    state_clicked = 'Connecticut';
                    break;
                case 'DE':
                    state_clicked = 'Delaware';
                    break;
                case 'FL':
                    state_clicked = 'Florida';
                    break;
                case 'GA':
                    state_clicked = 'Georgia';
                    break;
                case 'HI':
                    state_clicked = 'Hawaii';
                    break;
                case 'ID':
                    state_clicked = 'Idaho';
                    break;
                case 'IL':
                    state_clicked = 'Illinois';
                    break;
                case 'IN':
                    state_clicked = 'Indiana';
                    break;
                case 'IA':
                    state_clicked = 'Iowa';
                    break;
                case 'KS':
                    state_clicked = 'Kansas';
                    break;
                case 'KY':
                    state_clicked = 'Kentucky';
                    break;
                case 'LA':
                    state_clicked = 'Louisiana';
                    break;
                case 'ME':
                    state_clicked = 'Maine';
                    break;
                case 'MD':
                    state_clicked = 'Maryland';
                    break;
                case 'MA':
                    state_clicked = 'Massachusetts';
                    break;
                case 'MI':
                    state_clicked = 'Michigan';
                    break;
                case 'MN':
                    state_clicked = 'Minnesota';
                    break;
                case 'MS':
                    state_clicked = 'Mississippi';
                    break;
                case 'MO':
                    state_clicked = 'Missouri';
                    break;
                case 'MT':
                    state_clicked = 'Montana';
                    break;
                case 'NE':
                    state_clicked = 'Nebraska';
                    break;
                case 'NV':
                    state_clicked = 'Nevada';
                    break;
                case 'NH':
                    state_clicked = 'New Hampshire';
                    break;
                case 'NJ':
                    state_clicked = 'New Jersey';
                    break;
                case 'NM':
                    state_clicked = 'New Mexico';
                    break;
                case 'NY':
                    state_clicked = 'New York';
                    break;
                case 'NC':
                    state_clicked = 'North Carolina';
                    break;
                case 'ND':
                    state_clicked = 'North Dakota';
                    break;
                case 'OH':
                    state_clicked = 'Ohio';
                    break;
                case 'OK':
                    state_clicked = 'Oklahoma';
                    break;
                case 'OR':
                    state_clicked = 'Oregon';
                    break;
                case 'PA':
                    state_clicked = 'Pennsylvania';
                    break;
                case 'RI':
                    state_clicked = 'Rhode Island';
                    break;
                case 'SC':
                    state_clicked = 'South Carolina';
                    break;
                case 'SD':
                    state_clicked = 'South Dakota';
                    break;
                case 'TN':
                    state_clicked = 'Tennessee';
                    break;
                case 'TX':
                    state_clicked = 'Texas';
                    break;
                case 'UT':
                    state_clicked = 'Utah';
                    break;
                case 'VT':
                    state_clicked = 'Vermont';
                    break;
                case 'VA':
                    state_clicked = 'Virginia';
                    break;
                case 'WA':
                    state_clicked = 'Washington';
                    break;
                case 'WV':
                    state_clicked = 'West Virginia';
                    break;
                case 'WI':
                    state_clicked = 'Wisconsin';
                    break;
                case 'WY':
                    state_clicked = 'Wyoming';
                    break;
            }
            $('#alert')
                .text('Click '+state_clicked+' on map 1')
                .stop()
                .css('backgroundColor', '#ff0')
                .animate({backgroundColor: '#ddd'}, 1000);
            $('#hours-to-buy-input')
                .val(state_clicked);
            document.fourteen.submit();
	    }
    });
})


