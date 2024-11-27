import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="food-filter"
export default class extends Controller {
  static targets = ["foodItem", "foodRequest"]

  connect() {
    console.log("FoodFilter controller connected");

     // Afficher "Food Available" par défaut
     this.showFoodItems();
  }

  showFoodItems() {
    this.foodItemTarget.classList.remove('d-none')
    this.foodRequestTarget.classList.add('d-none')

    this.element.querySelectorAll(".btn-lighblue").forEach(button => button.classList.remove('selected'));
    this.element.querySelector('[data-action="click->food-filter#showFoodItems"]').classList.add('selected');
  }

  showRequests() {
    this.foodItemTarget.classList.add('d-none')
    this.foodRequestTarget.classList.remove('d-none')
    
    this.element.querySelectorAll(".btn-lighblue").forEach(button => button.classList.remove('selected'));
    this.element.querySelector('[data-action="click->food-filter#showRequests"]').classList.add('selected');
  }

}
