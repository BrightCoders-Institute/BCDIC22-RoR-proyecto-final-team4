
  var isFirstLoad = true;
  var reloadInterval;

  var timeout = setTimeout("location.reload(true);", 500);

  window.onload = function() {
    clearTimeout(timeout);
  }

