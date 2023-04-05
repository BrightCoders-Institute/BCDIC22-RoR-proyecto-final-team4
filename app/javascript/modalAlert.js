
function addH2() {
  var h2 = document.createElement("h2");
  var text = document.createTextNode("This information is already taken");
  h2.appendChild(text);
   h2.classList.add("message");
  document.querySelector(".close").insertAdjacentElement("afterend", h2);
  
  setTimeout(function() {
    h2.remove();
  }, 5000);
}

