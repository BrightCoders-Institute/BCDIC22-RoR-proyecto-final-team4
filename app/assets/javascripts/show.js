document.addEventListener("DOMContentLoaded", function() {
  let btn1 = document.getElementById("likeboton");
  let btn2 = document.getElementById("dislikeboton");
  let contador_btn1 = 0;
  let contador_btn2 = 0;
  
  btn1.addEventListener("click", function() {
    contador_btn1++;
    if (contador_btn1 === 1) {
      btn1.classList.add("desactivado");
      btn2.classList.remove("desactivado");
      btn2.disabled = false;
      contador_btn2 = 0;
    } else if (contador_btn1 >= 2) {
      btn1.disabled = true;
      contador_btn1 = 0;
    }
  });
  
  btn2.addEventListener("click", function() {
    contador_btn2++;
    if (contador_btn2 === 1) {
      btn2.classList.add("desactivado");
      btn1.classList.remove("desactivado");
      btn1.disabled = false;
      contador_btn1 = 0;
    } else if (contador_btn2 >= 2) {
      btn2.disabled = true;
      contador_btn2 = 0;
    }
  });
});
