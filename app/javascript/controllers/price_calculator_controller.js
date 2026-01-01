import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["costPrice", "sellingPrice", "margin"]

  connect() {
    this.calculateMargin()
  }

  calculateMargin() {
    const costPrice = parseFloat(this.costPriceTarget.value) || 0
    const sellingPrice = parseFloat(this.sellingPriceTarget.value) || 0
    
    if (costPrice > 0 && sellingPrice > 0) {
      const margin = ((sellingPrice - costPrice) / sellingPrice * 100).toFixed(1)
      if (this.hasMarginTarget) {
        this.marginTarget.textContent = `利益率: ${margin}%`
      }
    } else {
      if (this.hasMarginTarget) {
        this.marginTarget.textContent = "利益率: -"
      }
    }
  }
}