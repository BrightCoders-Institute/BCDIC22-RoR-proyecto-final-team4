
$(document).on('click', '#likeboton, #dislikeboton', function(event) {
  event.preventDefault();
  let button = $(this);
  let url = button.attr('href');
  let type = button.data('type');
  $.ajax({
    url: url,
    type: 'PATCH',
    data: {type: type},
    dataType: 'json',
    success: function(response) {
      $('#punctuation').text(response.punctuation);
      button.siblings().removeClass('desactivado').prop('disabled', false);
      button.addClass('desactivado').prop('disabled', true);
      
    }
  });
});


