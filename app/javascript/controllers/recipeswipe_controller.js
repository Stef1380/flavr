import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["target1", "target2", "target3", "target4", "target5", "down", "suppdown", "btnfinish", "btngauche", "btndroite", "downdeux"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  return() {
    // Logique pour naviguer en arrière et ajuster les classes d-none pour btnfinish et btndroite
    if (!this.target2Target.classList.contains("d-none")) {
      this.target1Target.classList.remove("d-none")
      this.target2Target.classList.add("d-none")
      this.btnfinishTarget.classList.add("d-none")
      this.btndroiteTarget.classList.remove("d-none")
    } else if (!this.target3Target.classList.contains("d-none")) {
      this.target2Target.classList.remove("d-none")
      this.target3Target.classList.add("d-none")
      this.btnfinishTarget.classList.add("d-none")
      this.btndroiteTarget.classList.remove("d-none")
    } else if (!this.target4Target.classList.contains("d-none")) {
      this.downTarget.classList.add("d-none")
      this.suppdownTarget.classList.remove("d-none")
      this.target3Target.classList.remove("d-none")
      this.target4Target.classList.add("d-none")
      this.btnfinishTarget.classList.add("d-none")
      this.btndroiteTarget.classList.remove("d-none")
    } else if (!this.target5Target.classList.contains("d-none")) {
      this.target4Target.classList.remove("d-none")
      this.target5Target.classList.add("d-none")
      this.btnfinishTarget.classList.add("d-none")
      this.btndroiteTarget.classList.remove("d-none")
    }
  }

  next() {
    // Logique pour naviguer en avant et ajuster les classes d-none pour btnfinish et btndroite
    if (!this.target1Target.classList.contains("d-none")) {
      this.target2Target.classList.remove("d-none")
      this.target1Target.classList.add("d-none")
    } else if (!this.target2Target.classList.contains("d-none")) {
      this.target3Target.classList.remove("d-none")
      this.target2Target.classList.add("d-none")
      this.downTarget.classList.add("d-none")
      this.suppdownTarget.classList.remove("d-none")
    } else if (!this.target3Target.classList.contains("d-none")) {
      this.downTarget.classList.add("d-none")
      this.target4Target.classList.remove("d-none")
      this.target3Target.classList.add("d-none")
    } else if (!this.target4Target.classList.contains("d-none")) {
      this.target5Target.classList.remove("d-none")
      this.target4Target.classList.add("d-none")
      this.btnfinishTarget.classList.remove("d-none") // Retire d-none pour btnfinish à target5
      this.btndroiteTarget.classList.add("d-none") // Ajoute d-none à btndroite à target5
    }
  }

  down() {
    this.downTarget.classList.toggle("d-none")
    this.suppdownTarget.classList.toggle("d-none")
    $(this.downTarget).collapse('toggle') // Correction de la syntaxe pour la référence jQuery
  }
}
