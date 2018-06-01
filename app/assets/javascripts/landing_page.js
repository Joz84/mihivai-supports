var sPath = window.location.pathname;
var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);

console.log(sPage);
if (sPage == "landing_pages") {
  const new_page = document.getElementById("new_landing_page");
  const display = document.getElementById("display_landing_pages");

  function testWidth(){
    console.log(new_page.style.width,display.style.width);
    if(window.innerWidth <= 850){
      new_page.style.width = "100%";
      display.style.width = "100%";
    }else{
      new_page.style.width = "60%";
      display.style.width = "40%";
    }
  }

  testWidth();

  //if playing on desktop

  window.addEventListener('resize',()=>{
    testWidth();
  });
}
