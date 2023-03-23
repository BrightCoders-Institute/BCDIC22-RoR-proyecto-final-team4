$(document).on('click', '#likeboton, #dislikeboton', function(event) {
  event.preventDefault();
  $.ajax({
    url: $(this).attr("href"),
    type: 'PATCH',
    data: {type: $(this).data("type")},
    dataType: 'json',
    success: function(response) {
      $('#punctuation').text(response.punctuation);
    }
  });
});
