// $.fn.editable.defaults.mode = 'inline';

$(document).on('turbolinks:load', function(){

  $('.editable').click(function(e) {
    e.preventDefault();
  });

  $('.toggle-editable').click(function(e) {
    e.preventDefault();
    elm = $('.toggle-editable');

    // console.log(elm.data('disabled'));
    set_traducibles(elm.data('disabled'));
    if(elm.data('disabled') == 'true'){
      elm.data('disabled', 'false');
    } else {
      elm.data('disabled', 'true');
    }
  });

});

function set_traducibles(disabled) {
  $('.editable').editable({
    type: 'textarea',
    rows: 1,
    mode: 'inline',
    pk: 1,
    url: '/post',
    title: 'Enter username',
    disabled: disabled,
    success: function(response, newValue) {
                  $('.save-translations').removeClass('hidden');
                }
  });
}
