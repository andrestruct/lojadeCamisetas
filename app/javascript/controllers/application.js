import { Application } from "@hotwired/stimulus"
import "bootstrap"  // Importando o Bootstrap

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
