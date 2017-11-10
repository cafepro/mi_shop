// $.fn.editable.defaults.mode = 'inline';

$(document).on('turbolinks:load', function(){

  $('.toggle-editable').click(function(e) {
    e.preventDefault();
    elm = $('.toggle-editable');

    // console.log(elm.data('disabled'));
    // finalmente no desactiva los traducibles así que siempre
    // queda en false el disabled
    set_traducibles(elm.data('disabled'));
    if(elm.data('disabled') == 'true'){
      elm.data('disabled', 'false');
    } else {
      elm.data('disabled', 'true');
    }
    elm.addClass('hidden');
    $('.btn-save-translations').removeClass('hidden');
  });

  $('.btn-save-translations').click(function(e) {
    e.preventDefault();
    $('form.form-inline.editableform').submit();
    $('.btn-save-translations').html('<i class="fa fa-spin fa-circle-o-notch" aria-hidden="true"></i>');
  });

});

function set_traducibles(disabled) {
  $('.editable').editable({
    type: 'textarea',
    rows: 4,
    mode: 'inline',
    pk: 1,
    url: '/post',
    disabled: disabled,
    success: function(response, newValue) {
                  $('.save-translations').removeClass('hidden');
                  $('.btn-save-translations').html('<i class="fa fa-fw fa-save"></i>');
                }
  });
}
