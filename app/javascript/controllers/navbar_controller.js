import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['bubbleMenu', 'toggleButton', 'search']

  connect() {
    console.log('navbar connected')
    console.log(this.bubbleMenuTarget)
  }

  showMenu() {
    console.log('avatar clicked')
    this.bubbleMenuTarget.classList.toggle('show')
    this.toggleButtonTarget.classList.toggle('active')
  }

  toggleSearch() {
    this.searchTarget.classList.toggle('show')
  }
}
