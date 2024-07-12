import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap";

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["categoryModal", "actionModal"]

  connect() {
    console.log("Modal controller connected")
    // Initialisation des variables de catégorie et d'action
    this.categoryModal = null;
    this.actionModal = null;
  }

  showCategoryModal() {
    console.log("J'ai cliqué sur le bouton de la navbar")
    // Affichage de la modal de catégorie
    this.categoryModalTarget.classList.remove("d-none")
  }

  selectCategory(event) {
    // Sélection de la catégorie et affichage de la modal d'action
    this.categoryModal = event.currentTarget.dataset.category
    this.categoryModalTarget.classList.add("d-none")
    this.actionModalTarget.classList.remove("d-none")
  }

  selectAction(event) {
    // Sélection de l'action et redirection vers le formulaire de création d'un item
    this.actionModal = event.currentTarget.dataset.type
    const url = `/items/new?category=${this.categoryModal}&type=${this.actionModal}`
    window.location.href = url
  }
}
