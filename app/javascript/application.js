// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import Rails from "@rails/ujs"
import * as bootstrap from "bootstrap"
import Turbolinks from "turbolinks"


Rails.start()
Turbolinks.start()