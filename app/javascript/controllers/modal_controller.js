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
    this.categoryModalTarget.classList.remove("d-none")
  }

  // Sélectionner la catégorie et afficher la modale d'action
  selectCategory(event) {
    this.categoryModal = event.currentTarget.dataset.category
    this.categoryModalTarget.classList.add("d-none")
    this.actionModalTarget.classList.remove("d-none")
  }

  // Sélectionner l'action et rediriger vers le formulaire de création d'un item
  selectAction(event) {
    this.actionModal = event.currentTarget.dataset.type
    const url = `/items/new?category=${this.categoryModal}&type=${this.actionModal}`
    window.location.href = url
  }

  // Fermer la modale en masquant la modale actuelle
  closeModal() {
    if (!this.categoryModalTarget.classList.contains("d-none")) {
      this.categoryModalTarget.classList.add("d-none")
    } else if (!this.actionModalTarget.classList.contains("d-none")) {
      this.actionModalTarget.classList.add("d-none")
    }
  }
}
