import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="etape-recipe"
export default class extends Controller {
  static targets = ["divg", "regime", "regimebtn", "objectif", "objectifbtn", "Restriction", "Restrictionbtn","divg2", "formrestriction", "formobjectif", "formregime"]
  connect() {
  }
  RestrictionEdit() {
    this.divg2Target.classList.remove("d-none")

     this.divgTarget.classList.add("d-none")

     this.formrestrictionTarget.classList.remove("d-none")
     this.formobjectifTarget.classList.add("d-none")
     this.formregimeTarget.classList.add("d-none")
  }
  regimeEdit() {
    this.divg2Target.classList.remove("d-none")

    this.divgTarget.classList.add("d-none")

    this.formregimeTarget.classList.remove("d-none")

    this.formrestrictionTarget.classList.add("d-none")
    this.formobjectifTarget.classList.add("d-none")
  }
  ObjectifEdit() {
    this.divg2Target.classList.remove("d-none")
    this.divgTarget.classList.add("d-none")

    this.formrestrictionTarget.classList.add("d-none")
    this.formregimeTarget.classList.add("d-none")
    this.formobjectifTarget.classList.remove("d-none")
  }
  return(){
     this.divg2Target.classList.add("d-none")
     this.divgTarget.classList.remove("d-none")
  }
}
// static targets = ["step", "ingredients", "arrow1", "arrow2", "one"]
// next() {
// }

// toggleUstenstilAndIngredients() {
//   console.log(this.arrow1Target)
//   this.ingredientsTarget.classList.remove("d-none")
//   this.oneTarget.classList.add("d-none")
//   // this.arrow1Target.classList.add("d-none")
//   this.arrow2Target.classList.remove("d-none")
// }

// toggledIngredientsAndSteps() {
//   this.ingredientsTarget.classList.add("d-none")
//   this.stepTarget.classList.remove("d-none")
//   // this.arrow2Target.classList.add("d-none")
// }
