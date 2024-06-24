
main = () => {
    

    // Goes to DOM, searches for element with ID 'cta' and adds a listener (waiting for something to occur, in this case 'click') and performs an action.
    document.getElementById("cta").addEventListener('click', () => {
        alert("Button Clicked")
    })
}


mybutton = document.getElementById("myBtn");


window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
} 

main()
