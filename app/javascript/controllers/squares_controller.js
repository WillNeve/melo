import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="squares"
export default class extends Controller {
  static targets = ['squaresCont', 'login', 'signup', 'about', 'topLeft', 'topRight', 'blackBox', 'miniBlackBox']
  connect() {
    console.log('tiles connected')
  }

  aboutMode(event) {
    event.preventDefault()

    if (this.squaresContTarget.classList.contains('about')) {
      this.aboutTarget.innerHTML = 'About us'

      this.blackBoxTarget.classList.toggle('active');
      this.miniBlackBoxTarget.classList.toggle('active');

      this.topLeftTarget.classList.toggle('shift')
      this.topRightTarget.classList.toggle('shift')
      setTimeout(() => {
        this.squaresContTarget.classList.toggle('about')
        setTimeout(() => {
          this.loginTarget.classList.toggle('about')
          this.signupTarget.classList.toggle('about')
        }, 300);
      }, 300);
    } else {
      this.aboutTarget.innerHTML = '<i class="fa-solid fa-arrow-left"></i>'

      this.loginTarget.classList.toggle('about')
      this.signupTarget.classList.toggle('about')
      setTimeout(() => {
        this.squaresContTarget.classList.toggle('about')
      }, 150);
      setTimeout(() => {
        this.topLeftTarget.classList.toggle('shift')
        this.topRightTarget.classList.toggle('shift')
      }, 450);
      setTimeout(() => {
        this.blackBoxTarget.classList.toggle('active');
        this.miniBlackBoxTarget.classList.toggle('active');
      }, 750);
    }
  }
}
