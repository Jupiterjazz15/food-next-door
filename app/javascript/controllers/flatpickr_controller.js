import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['startDateInput', 'endDateInput', 'useByDateInput']
  connect() {
    flatpickr(this.startDateInputTarget, {
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
     })
    flatpickr(this.useByDateInputTarget, {
      enableTime: true,
      dateFormat: "Y-m-d",
    })
  }
}
