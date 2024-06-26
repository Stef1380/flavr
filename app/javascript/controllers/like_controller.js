import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["linkLike", "linkDislike", "card", "preference"];
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  likeIt(event) {
    event.preventDefault();
    fetch(this.linkLikeTarget.href, {
      method: "GET",
      headers: {
        "X-CSRF-Token": this.csrfToken,
        Accept: "text/plain",
      },
    })
      .then((response) => response.text())
      .then((data) => {
        const ingredientName = document.querySelector("#dataDisplay");
        if (ingredientName) {
          this.preferenceTarget.insertAdjacentHTML(
            "beforeend",
            `<p>${ingredientName.textContent}</p>`
          );
        }
        this.cardTarget.outerHTML = data;
      });
  }

  dislikeIt(event) {
    event.preventDefault();
    fetch(this.linkDislikeTarget.href, {
      method: "GET",
      headers: {
        "X-CSRF-Token": this.csrfToken,
        Accept: "text/plain",
      },
    })
      .then((response) => response.text())
      .then((data) => {
        this.cardTarget.outerHTML = data;
      });
  }
}
