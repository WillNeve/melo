import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="squares"
export default class extends Controller {
  static targets = ['squaresCont', 'login', 'signup', 'about', 'topLeft', 'topRight', 'blackBox', 'miniBlackBox', 'square', 'squares']
  connect() {
    console.log('tiles connected')
    this.isToggleOn = false;
    this.originalColors = new WeakMap();
    this.toggleColors = ['rgb(184, 48, 42)', 'rgb(54, 118, 231)', 'rgb(232, 181, 3)'];
  }


  changeColor(event) {
    event.preventDefault();

    const square = event.target;
    const originalColor = square.style.background;

    let newColor;
    do {
      this.next_colors = this.toggleColors.filter(color => color !== originalColor);
      newColor = this.next_colors[Math.floor(Math.random() * this.next_colors.length)];
    } while (newColor === square.style.background);

    square.style.background = newColor;
    console.log(newColor);
    console.log(this.next_colors)
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
    console.log(this.scope)
  }
}
