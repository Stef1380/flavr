import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["loader"];

  connect() {}

  display() {
    this.loaderTarget.classList.remove("d-none");
  }
}
