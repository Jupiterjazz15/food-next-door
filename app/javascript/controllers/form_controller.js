import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["categoryField", "foodCondition", "homeCondition", "bestBeforeDate"]

  connect() {
    console.log("Form controller connected")
    this.toggleConditions()
    this.toggleBestBeforeDate()
  }

  toggleConditions() {
    const category = this.categoryFieldTarget.value
    if (category === 'Food') {
      this.foodConditionTarget.classList.remove('d-none')
    } else if (category === 'Home') {
      this.homeConditionTarget.classList.remove('d-none')
    }
  }

  toggleBestBeforeDate() {
    const type = document.querySelector('input[name="type"]').value
    const category = this.categoryFieldTarget.value
    if (type === 'donation' && category === 'food') {
      this.bestBeforeDateTarget.classList.remove('d-none')
    } else {
      this.bestBeforeDateTarget.classList.add('d-none')
    }
  }
}
