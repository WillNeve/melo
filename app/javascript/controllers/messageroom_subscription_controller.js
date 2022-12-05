import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values =
  { roomId: Number,
    userId: Number}
  static targets = ["messages", "message", "input", 'submit']

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "MessageroomChannel", id: this.roomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  submit(event) {
    if (this.inputTarget.value = '') {
      event.preventDefault()
    }
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    this.inputTarget.value = ''
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    const last_message = this.messageTargets[this.messageTargets.length - 1]
    if (parseInt(last_message.dataset.user, 10) === this.userIdValue) {
      last_message.classList.add('own')
    } else {
      last_message.classList.remove('own')
    }
  }


}
