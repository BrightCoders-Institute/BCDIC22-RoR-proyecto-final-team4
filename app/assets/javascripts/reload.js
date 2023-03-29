
  var isFirstLoad = true;
  var reloadInterval;

  var timeout = setTimeout("location.reload(true);", 1000);

  window.onload = function() {
    clearTimeout(timeout);
  }

