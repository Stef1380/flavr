import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="newprofil"
export default class extends Controller {
  static targets = ["formone", "formdeux", "formtrois","formquatre"]
  connect() {
    console.log("d");
  }
  skip(){
    console.log("e");
    if (!this.formoneTarget.classList.contains("d-none")) {
        this.formdeuxTarget.classList.remove("d-none")
        this.formoneTarget.classList.add("d-none")
      } else if (!this.formdeuxTarget.classList.contains("d-none")) {
        this.formtroisTarget.classList.remove("d-none")
        this.formdeuxTarget.classList.add("d-none")
      }else if (!this.formtroisTarget.classList.contains("d-none")) {
        this.formquatreTarget.classList.remove("d-none")
        this.formtroisTarget.classList.add("d-none")
    }
  }
  return() {
    if (!this.formdeuxTarget.classList.contains("d-none")) {
      this.formoneTarget.classList.remove("d-none")
      this.formdeuxTarget.classList.add("d-none")
      } else if (!this.formtroisTarget.classList.contains("d-none")) {
        this.formdeuxTarget.classList.remove("d-none")
        this.formtroisTarget.classList.add("d-none")
      }else if (!this.formquatreTarget.classList.contains("d-none")) {
        this.formtroisTarget.classList.remove("d-none")
        this.formquatreTarget.classList.add("d-none")
      }
  }
}
