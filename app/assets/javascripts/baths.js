// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var initializeBathsDatatable = function(tableId, callbackFunction, toolbarElement) {
    table = $('#' + tableId).dataTable({
        "fnDrawCallback": function(oSettings) {
            callbackFunction(this, toolbarElement);
        },
        "bPaginate": true,
        "iDisplayLength": 10,
        "bSearchable": true,
        "bLengthChange": false,
        "sAjaxSource": $('#' + tableId).data('source'),
        "bInfo": false,
        "aoColumnDefs": [{
                "name": 'date',
                "bVisible": true,
                "aTargets": [0]
            }, {
                "name": 'amount_spent',
                "bVisible": true,
                "aTargets": [1]
            }, {
                "name": 'time_spent',
                "bVisible": true,
                "aTargets": [2]
            }, {
                "name": 'ideal_amount',
                "bVisible": true,
                "aTargets": [3]
            }

        ],
        "sDom": "T<'row'<'span6'<'toolbar'<>>><'span6'f>><'row'<'span12't>><'row'<'span12'p>>"
    });
};

var translateFields = function() {
    $('#baths_previous').html("Anterior");
    $('#baths_next').html("Próximo");
};

var machineState = function() {
    var green = "#64FF64",
        red = '#ff3333',
        orange = '#FFCC5D',
        yellow = '#FFFF00',
        yellowGreen = '#C9F32B';

    $("#baths > tbody > tr").each(function(i, el) {
        var amount_spent = parseFloat($(el).find("td:nth-child(2)").html()),
            time_spent = parseFloat($(el).find("td:nth-child(3)").html()),
            ideal_amount = parseFloat($(el).find("td:nth-child(4)").html()),
            state = amount_spent / ideal_amount;

        if (state >= 1.15) {
            $(el).css("background-color", red);

        } else if (state < 1.15 && state > 1) {
            $(el).css("background-color", orange);

        } else if (state == 1) {
            $(el).css("background-color", yellow);

        } else if (state < 1 && state > 0.85) {
            $(el).css("background-color", yellowGreen);

        } else if (state <= 0.85) {
            $(el).css("background-color", green);
        }
    });
};

var updateDataTables = function() {
    machineState();
    translateFields();
};
