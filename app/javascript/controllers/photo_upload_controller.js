import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-upload"
export default class extends Controller {
  static targets = ["photoInput", "photoPreviewContainer", "photoPreview", "photoButton", "photoIcon"];

  connect() {
    console.log("PhotoUpload controller connected");
  }

  // Sélectionner une photo
  selectPhoto() {
    this.photoInputTarget.click();
  }

  // Prévisualiser la photo
  previewPhoto(event) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        this.photoPreviewTarget.src = e.target.result;
        this.photoPreviewContainerTarget.classList.remove("d-none");
        this.photoButtonTarget.classList.add("d-none");
        this.photoIconTarget.classList.add("d-none");
      };
      reader.readAsDataURL(file);
    }
  }

  // Changer la photo
  changePhoto() {
    this.photoInputTarget.value = "";
    this.photoPreviewContainerTarget.classList.add("d-none");
    this.photoButtonTarget.classList.remove("d-none");
    this.photoIconTarget.classList.remove("d-none");
  }
}
