// app/javascript/controllers/matches_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "scorers"]

  addScorer(event) {
    event.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.scorersTarget.insertAdjacentHTML('beforeend', content)
  }

  removeScorer(event) {
    event.preventDefault()
    event.target.closest('.nested-fields').remove()
  }
}
