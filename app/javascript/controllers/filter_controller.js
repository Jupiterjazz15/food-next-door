import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["itemDonation", "itemRequest"]

  connect() {
    console.log("Filter controller connected");

     // Afficher "Donations Available" par défaut
     this.showDonationItems();
  }

  showDonationItems() {
    this.itemDonationTarget.classList.remove('d-none')
    this.itemRequestTarget.classList.add('d-none')

    this.element.querySelectorAll(".btn-lightblue").forEach(button => button.classList.remove('selected'));
    this.element.querySelector('[data-action="click->filter#showDonationItems"]').classList.add('selected');
  }

  showRequestItems() {
    this.itemDonationTarget.classList.add('d-none')
    this.itemRequestTarget.classList.remove('d-none')

    this.element.querySelectorAll(".btn-lightblue").forEach(button => button.classList.remove('selected'));
    this.element.querySelector('[data-action="click->filter#showRequestItems"]').classList.add('selected');
  }

}
