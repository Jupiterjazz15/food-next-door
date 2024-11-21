import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
// import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['startDateInput', 'endDateInput', 'useByDateInput']

  connect() {
    console.log("Controller Flatpicker connected")

    this.startPicker = flatpickr(this.startDateInputTarget, {
      dateFormat: "d-m-Y",
      mode: "range",
      enableTime: false,
      minDate: "today",
      onChange: (selectedDates) => {
        if (selectedDates.length === 2) {
          this.startDateInputTarget.value = flatpickr.formatDate(selectedDates[0], "d-m-Y");
          this.endDateInputTarget.value = flatpickr.formatDate(selectedDates[1], "d-m-Y");
        }
      }
    });

    flatpickr(this.useByDateInputTarget, {
      dateFormat: "d-m-Y",
    });

  }

  openStartPicker() {
    this.startPicker.open();
  }

}
