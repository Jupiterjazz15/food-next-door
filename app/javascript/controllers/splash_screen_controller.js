import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["url"]

  connect() {
    setTimeout(() => {
      this.hideSplashScreen();
      this.redirectToTarget();
    }, 1500);
  }

  // Disparition progressive du splash screen
  hideSplashScreen() {
    this.element.classList.add ("welcome-background-hidden");
  }
  // redirection vers la home page
  redirectToTarget() {
    setTimeout(() => {
      window.location.href = this.urlTarget.dataset.urlValue;
    }, 500);
  }

}
