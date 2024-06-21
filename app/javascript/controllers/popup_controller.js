import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["home", "flyer", "nav","bann","textInvisible"]
  connect() {
    console.log("d");
  }
  PopUp(){
    this.flyerTarget.classList.remove("d-none")
    this.homeTarget.classList.add("d-none")
    this.textInvisibleTarget.style.color = "#00564A"
    window.scrollTo({ top: 0, behavior: "smooth" });
    // this.navTarget.classList.add("d-none")
    // this.bannTarget.classList.add("d-none")
  }
  Return(){
    this.homeTarget.classList.remove("d-none")
    this.flyerTarget.classList.add("d-none")
    this.textInvisibleTarget.style.color = "white"
  }
}
