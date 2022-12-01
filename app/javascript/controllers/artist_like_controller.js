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
      alert('time to unlike');
      console.log(this.removeValue);
      const url = this.removeValue
      fetch(url, {
        method: "DELETE",
        // headers: { "Accept": "application/json",
        //             'X-CSRF-Token': '<%= form_authenticity_token.to_s %>'}
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
        })
    } else {
      alert('time to like');
      console.log(this.addValue);
      const url = this.addValue
      fetch(url, {
        method: "POST",
        // headers: { "Accept": "application/json",
        //             'X-CSRF-Token': '<%= form_authenticity_token.to_s %>'}
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
        })
    }
  }
}

// update() {
//   const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
//   fetch(url, {headers: {"Accept": "text/plain"}})
//     .then(response => response.text())
//     .then((data) => {
//       this.listTarget.outerHTML = data
//     })
// }
