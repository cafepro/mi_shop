// datatables functions
//
$(document).ready(function(){
  table = $('.datatable').DataTable({
    responsive: true,
    "autoWidth": false,
    "lengthMenu": [ 25, 50, 75, 100, 200 ],
    "dom": 'ifrtp'
  });

  // Remove accented character from search input as well
  $('#listing_asociates_filter input').keyup( function () {
    table.search(
        jQuery.fn.DataTable.ext.type.search.string( this.value )
      ).draw()
  });
});
