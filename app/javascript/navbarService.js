const openNav = () => {
  document.getElementById("mySidenavService").style.width = "12%";
  document.getElementById("mainService").style.marginLeft = "96%";
  // document.getElementById("mainService").style.background = "none";
  document.getElementById("logoService").style.display = "none";

}

const closeNav = () => {
  document.getElementById("mySidenavService").style.width = "0";
  document.getElementById("mainService").style.marginLeft= "0";
  document.getElementById("logoService").style.display = "block";
}
