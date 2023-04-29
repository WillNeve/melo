import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="squares"
export default class extends Controller {
  static targets = ['squaresCont', 'login', 'signup', 'about', 'topLeft', 'topRight', 'blackBox', 'miniBlackBox', 'square']
  connect() {
    console.log('tiles connected')
  }


  constructor() {
    super();
    this.isToggleOn = false;
    this.originalColors = new WeakMap();
    this.toggleColors = ['rgb(184, 48, 42)', 'rgb(54, 118, 231)', 'rgb(232, 181, 3)'];
  }

  changeColor(event) {
    const square = event.target;
    // const toggleColor = this.toggleColors[Math.floor(Math.random() * this.toggleColors.length)];
    let toggleColor, originalColor = this.originalColors.get(square);

    if (!originalColor) {
      originalColor = window.getComputedStyle(square).backgroundColor;
      this.originalColors.set(square, originalColor);
    }

    do {
      toggleColor = this.toggleColors[Math.floor(Math.random() * this.toggleColors.length)];
    } while (toggleColor === originalColor);

    if (this.isToggleOn) {
      square.style.backgroundColor = originalColor;
      this.isToggleOn = false;
    } else {
      square.style.backgroundColor = toggleColor;
      this.isToggleOn = true;
    }
    console.log(this.isToggleOn.toString())
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
