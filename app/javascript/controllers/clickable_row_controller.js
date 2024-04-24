
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  navigateTo(event) {
    // Evita que la acción se ejecute si el clic fue en los botones de editar o eliminar
    if (event.target.tagName === 'A' || event.target.tagName === 'I') {
      return;
    }

    window.location.href = this.urlValue;
  }
}
