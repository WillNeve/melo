import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-confirmation"
export default class extends Controller {
  static targets = ['background', 'modal']
  connect() {
  }

  confirm() {
    this.backgroundTarget.classList.add('show');
    this.modalTarget.classList.add('show')
  }
}
