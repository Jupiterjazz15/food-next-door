import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["category", "foodCondition", "homeCondition", "bestBeforeDate"]

  connect() {
    console.log("Form controller connected")
    this.toggleConditions()
    this.toggleBestBeforeDate()
  }

  toggleConditions() {
    const category = this.categoryTarget.value
    if (category === 'Food') {
      this.foodConditionTarget.classList.remove('d-none')
      this.homeConditionTarget.classList.add('d-none')
    } else if (category === 'Home') {
      this.foodConditionTarget.classList.add('d-none')
      this.homeConditionTarget.classList.remove('d-none')
    } else {
      this.foodConditionTarget.classList.add('d-none')
      this.homeConditionTarget.classList.add('d-none')
    }
  }

  toggleBestBeforeDate() {
    const type = document.querySelector('input[name="type"]').value
    const category = this.categoryTarget.value
    if (type === 'donation' && category === 'food') {
      this.bestBeforeDateTarget.classList.remove('d-none')
    } else {
      this.bestBeforeDateTarget.classList.add('d-none')
    }
  }
}
