import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.body.addEventListener('keydown', function(e) {
  if(!(e.keyCode == 13 && (e.metaKey || e.ctrlKey))) return;

  var target = e.target;
  if(target.form) {
    target.form.submit();
  }
});




// Get all the nav-btns in the page
let navBtns = document.querySelectorAll('.nav-btn');

// Add an event handler for all nav-btns to enable the dropdown functionality
navBtns.forEach(function (ele) {
    ele.addEventListener('click', function() {
        // Get the dropdown-menu associated with this nav button (insert the id of your menu)
        let dropDownMenu = document.getElementById('header-menu');

        // Toggle the nav-btn and the dropdown menu
        ele.classList.toggle('active');
        dropDownMenu.classList.toggle('active');
    });
});