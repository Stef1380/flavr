import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recipeswipe"
export default class extends Controller {
  static targets = ["target1", "target2", "target3", "target4", "target5"]
  return() {
    if (!this.target2Target.classList.contains("d-none")) {
      this.target1Target.classList.remove("d-none")
      this.target2Target.classList.add("d-none")
      } else if (!this.target3Target.classList.contains("d-none")) {
        this.target2Target.classList.remove("d-none")
        this.target3Target.classList.add("d-none")

      }else if (!this.target4Target.classList.contains("d-none")) {
        this.target3Target.classList.remove("d-none")
        this.target4Target.classList.add("d-none")

       }else if (!this.target5Target.classList.contains("d-none")) {
        this.target4Target.classList.remove("d-none")
        this.target5Target.classList.add("d-none")
       }
  }
  next(){
    if (!this.target1Target.classList.contains("d-none")) {
      this.target2Target.classList.remove("d-none")
      this.target1Target.classList.add("d-none")
    } else if (!this.target2Target.classList.contains("d-none")) {
      this.target3Target.classList.remove("d-none")
      this.target2Target.classList.add("d-none")

    }else if (!this.target3Target.classList.contains("d-none")) {
      this.target4Target.classList.remove("d-none")
      this.target3Target.classList.add("d-none")

     }else if (!this.target4Target.classList.contains("d-none")) {
      this.target5Target.classList.remove("d-none")
      this.target4Target.classList.add("d-none")
     }
  }
}