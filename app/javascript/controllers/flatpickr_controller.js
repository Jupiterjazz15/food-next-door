import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
// import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['startDateInput', 'endDateInput', 'useByDateInput']

  connect() {
    console.log("Controller Flatpicker connected")

     // Initialiser flatpickr pour les champs de date de début et de fin
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

    // Vérifier si la cible `useByDateInput` existe avant d'initialiser flatpickr car elle n'est pas présente lorsque la catégorie est "Home"
    if (this.hasUseByDateInputTarget) {
      flatpickr(this.useByDateInputTarget, {
        dateFormat: "d-m-Y",
      });
    }
  }

  openStartPicker() {
    this.startPicker.open();
  }

}
