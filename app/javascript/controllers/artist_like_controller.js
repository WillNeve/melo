import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="artist-like"
export default class extends Controller {
  static targets = ['button']
  static values = {
    add: String,
    remove: String
  }
  connect() {
  }


  like(event) {
    event.preventDefault()
    if (this.buttonTarget.classList.contains('liked')) {
      const url = this.removeValue
      fetch(url, {
        method: "DELETE"
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
        })
      this.buttonTarget.classList.remove('liked')
    } else {
      const url = this.addValue
      fetch(url, {
        method: "POST"
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
          this.removeValue = `/user_likes/${data.id}`
        })
      this.buttonTarget.classList.add('liked')
    }
  }
}
