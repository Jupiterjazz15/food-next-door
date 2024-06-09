import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

// Connects to data-controller="modal"
export default class extends Controller {
  openCreateModal(event) {
    event.preventDefault();
    const createModalElement = document.getElementById('createModal');
    const createModal = new Modal(createModalElement);
    createModal.show();
  }

  selectCategory(event) {
    const category = event.currentTarget.dataset.category;
    this.selectedCategory = category;
    const createModalElement = document.getElementById('createModal');
    const createModal = Modal.getInstance(createModalElement);
    createModal.hide();

    const actionModalElement = document.getElementById('actionModal');
    const actionModal = new Modal(actionModalElement);
    actionModal.show();
  }

  selectAction(event) {
    const actionType = event.currentTarget.dataset.actionType;
    const url = `/items/new?type=${actionType}&category=${this.selectedCategory}`;
    window.location.href = url;
  }
}
