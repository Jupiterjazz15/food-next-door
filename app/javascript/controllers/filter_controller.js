import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["itemDonation", "itemRequest"];

  connect() {
    console.log("Filter controller connected");

    this.showDonationItems(); // Afficher les dons par défaut
  }

  showDonationItems() {
    this.itemDonationTarget.classList.remove("d-none");
    this.itemRequestTarget.classList.add("d-none");
    this.updateButtonState("showDonationItems");
  }

  showRequestItems() {
    this.itemDonationTarget.classList.add("d-none");
    this.itemRequestTarget.classList.remove("d-none");
    this.updateButtonState("showRequestItems");
  }

  updateButtonState(activeAction) {
    // Mettre à jour les styles des boutons
    this.element.querySelectorAll(".btn-lightblue").forEach((button) => {
      button.classList.remove("selected");
    });
    this.element
      .querySelector(`[data-action="click->filter#${activeAction}"]`)
      .classList.add("selected");
  }

}
