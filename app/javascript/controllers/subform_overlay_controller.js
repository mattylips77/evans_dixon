// src/controllers/subform_overlay_controller.js
import {Controller} from "@hotwired/stimulus"
export default class extends Controller {
    static targets = ["overlay", "subformbody"]
    clickMe = () => {
        alert("clickME")
    }
}