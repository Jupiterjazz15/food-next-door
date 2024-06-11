import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = { selectedCategory: String };

  openCategoryModal(event) {
    event.preventDefault();
    console.log("Open category modal");
    const categoryModalElement = document.getElementById('categoryModal');
    const categoryModal = new Modal(categoryModalElement);
    categoryModal.show();
  }

  selectCategory(event) {
    const category = event.currentTarget.dataset.category;
    this.selectedCategoryValue = category;
    console.log("Selected category:", this.selectedCategoryValue);

    // Faire persister la catégorie sélectionnée
    this.element.dataset.selectedCategoryValue = category;
    console.log("Persisted selected category:", this.element.dataset.selectedCategoryValue);

    // Cacher la première modale
    const categoryModalElement = document.getElementById('categoryModal');
    const categoryModal = Modal.getInstance(categoryModalElement);
    categoryModal.hide();

    // Afficher la deuxième modale
    const actionModalElement = document.getElementById('actionModal');
    const actionModal = new Modal(actionModalElement);
    actionModal.show();
  }

  selectAction(event) {
    const actionType = event.currentTarget.dataset.actionType;

     // Retrouver la catégorie sélectionnée
     const category = this.element.dataset.selectedCategoryValue;
     console.log("Category before redirect:", category);

    const url = `/items/new?type=${actionType}&category=${category}`;
    // window.location.href = url;
    console.log("Redirecting to URL:", url);
  }
}
