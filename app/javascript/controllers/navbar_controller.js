import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    console.log("Navbar controller connected");
  }

  toggleMenu(event) {
    this.menuTarget.classList.toggle("hidden");

    // Toggle icon
    const button = event.currentTarget;
    const icons = button.querySelectorAll("svg");
    icons.forEach((icon) => icon.classList.toggle("hidden"));
  }
}
