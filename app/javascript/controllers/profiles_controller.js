import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profiles"
export default class extends Controller {
  static targets = ["list", "profile"]

  connect() {
    this.updateProfileSizes();
  }

  updateProfileSizes() {
    const profilesCount = this.profileTargets.length;

    if (profilesCount <= 3) {
      this.listTarget.classList.add('size-large');
    } else if (profilesCount <= 6) {
      this.listTarget.classList.add('size-medium');
    } else {
      this.listTarget.classList.add('size-small');
    }
  }
}
