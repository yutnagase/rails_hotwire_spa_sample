import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { timeout: Number }

  connect() {
    if (this.timeoutValue > 0) {
      this.timeoutId = setTimeout(() => {
        this.dismiss()
      }, this.timeoutValue)
    }
  }

  disconnect() {
    if (this.timeoutId) {
      clearTimeout(this.timeoutId)
    }
  }

  dismiss() {
    this.element.remove()
  }
}