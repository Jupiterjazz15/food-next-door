import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["itemDonation", "itemRequest", "donationSearchField", "requestSearchField"];

  connect() {
    console.log("Filter controller connected");

    this.currentSection = "donation"; // Section par défaut
    this.showDonationItems(); // Afficher les dons par défaut
  }

  showDonationItems() {
    this.currentSection = "donation";
    this.clearSearchForOtherSection("donation"); // Efface la recherche de la section opposée
    this.itemDonationTarget.classList.remove("d-none");
    this.itemRequestTarget.classList.add("d-none");
    this.updateButtonState("showDonationItems");
  }

  showRequestItems() {
    this.currentSection = "request";
    this.clearSearchForOtherSection("request"); // Efface la recherche de la section opposée
    this.itemDonationTarget.classList.add("d-none");
    this.itemRequestTarget.classList.remove("d-none");
    this.updateButtonState("showRequestItems");
  }

  clearSearchForOtherSection(activeSection) {
    if (activeSection === "donation" && this.hasRequestSearchFieldTarget) {
      // Efface la barre de recherche pour les demandes
      this.requestSearchFieldTarget.value = "";
      this.clearQueryParams();
    } else if (activeSection === "request" && this.hasDonationSearchFieldTarget) {
      // Efface la barre de recherche pour les dons
      this.donationSearchFieldTarget.value = "";
      this.clearQueryParams();
    }
  }

  clearQueryParams() {
    // Supprimer les paramètres de recherche de l'URL
    const url = new URL(window.location);
    url.searchParams.delete("query");
    window.history.replaceState({}, document.title, url);
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
