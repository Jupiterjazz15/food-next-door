import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['startDateInput']
  connect() {
    flatpickr(this.startDateInputTarget, {
      plugins: [new rangePlugin({ input: this.endDateInputTarget })],
      dateFormat: "Y-m-d",
      altInput: true,
      altFormat: "F j, Y",
    });
  }
}
