// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var initializeBathsDatatable = function (tableId, callbackFunction, toolbarElement) {
  table = $('#' + tableId).dataTable({
    "fnDrawCallback": function (oSettings) {
      callbackFunction(this, toolbarElement);
    },
    "bPaginate": true,
    "iDisplayLength": 10,
    "bSearchable": true,
    "bLengthChange": false,
    "sAjaxSource": $('#' + tableId).data('source'),
    "bInfo": false,
    "aoColumnDefs": [
      {
        "name": 'date',
        "bVisible": true,
        "aTargets": [0]
      },
      {
        "name": 'amount_spent',
        "bVisible": true,
        "aTargets": [1]
      },
      {
        "name": 'time_spent',
        "bVisible": true,
        "aTargets": [2]
      },
      {
        "name": 'ideal_amount',
        "bVisible": true,
        "aTargets": [3]
      }

    ],
    "sDom": "T<'row'<'span6'<'toolbar'<>>><'span6'f>><'row'<'span12't>><'row'<'span12'p>>"
  });
};
