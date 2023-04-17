const openNav = () => {
  const mySidenavService = document.getElementById("mySidenavService");
  const overlay = document.getElementById("overlay");
  if (window.innerWidth >= 1080 && mySidenavService && overlay) {
    document.getElementById("mySidenavService").style.width = "12%"; 
    document.getElementById("mainService").style.marginLeft = "96%";
    document.getElementById("logoService").style.display = "none";
    overlay.style.display = "block";
    overlay.addEventListener("click", closeNav);
 
  }else {
    document.getElementById("mySidenavService").style.width = "100%";
    document.getElementById("mainService").style.marginLeft = "100%";
    document.getElementById("logoService").style.display = "none";
  }
 }
 
 const closeNav = () => {
  document.getElementById("mySidenavService").style.width = "0";
  document.getElementById("mainService").style.marginLeft= "0";
  document.getElementById("logoService").style.display = "block";
  overlay.style.display = "none";
  document.getElementById("overlay").style.display = "none"; 
 }
 
 