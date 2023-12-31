// Menu manipulation

// Adds a toggle listener.
function addToggleListener(selected_id, menu_id, toggle_class) {
  let selected_element = document.querySelector(`#${selected_id}`);
  selected_element.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector(`#${menu_id}`)
    menu.classList.toggle(toggle_class);
  });
}

// Add toggle listeners to listen for clicks.
document.addEventListener("turbo:load", function() {
  addToggleListener("hamburger", "navbar-menu",   "collapse");
  addToggleListener("maintain",   "dropdown-menu1", "active");
  addToggleListener("account",   "dropdown-menu2", "active");
});