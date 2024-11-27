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

  // Afficher la modale de catégorie
  showCategoryModal() {
    console.log("J'ai cliqué sur le bouton de la navbar")
    // Affichage de la modal de catégorie
    this.categoryModalTarget.classList.remove("d-none");
    this.categoryModalTarget.setAttribute("aria-hidden", "false");
  }

  // Sélectionner la catégorie et afficher la modale d'action
  selectCategory(event) {
    this.categoryModal = event.currentTarget.dataset.category
    this.categoryModalTarget.classList.add("d-none");
    this.categoryModalTarget.setAttribute("aria-hidden", "true");
    this.actionModalTarget.classList.remove("d-none");
    this.actionModalTarget.setAttribute("aria-hidden", "false");
  }

  hideCategoryModal() {
    this.categoryModalTarget.classList.add("d-none");
    this.categoryModalTarget.setAttribute("aria-hidden", "true");
  }

  // Sélection de l'action et redirection vers le formulaire de création d'un item
  selectAction(event) {
    this.actionModal = event.currentTarget.dataset.type;
    const url = `/items/new?category=${this.categoryModal}&type=${this.actionModal}`;
    window.location.href = url;
  }

  hideActionModal() {
    this.actionModalTarget.classList.add("d-none");
    this.actionModalTarget.setAttribute("aria-hidden", "true");
  }
}
