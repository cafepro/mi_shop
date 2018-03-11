// datatables functions
//
$(document).ready(function(){
  $('.datatable').DataTable({
    responsive: true,
    "autoWidth": false,
    "lengthMenu": [ 25, 50, 75, 100, 200 ],
    "dom": 'ifrtp'
  });
});
