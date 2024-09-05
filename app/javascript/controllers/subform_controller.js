// src/controllers/subform_controller.js
import {Controller} from "@hotwired/stimulus"
export default class extends Controller {
    static targets = ["button", "savedForms", "overlay", "subformbody"];

    initialize() {
        console.log('stim test')
    }

    closeOverlay = (e) => {
        this.overlayTarget.classList.add("hidden")
    }

    addForm = async (e) => {
        e.preventDefault()
        try {
            const response = await fetch('/client_data_entries/30/sub_form');
            if (response.ok) {
                const subformHtml = await response.text()
                this.subformbodyTarget.innerHTML = subformHtml
            }

        } catch (error) {
            console.error("Fetch error:", error);
        }

        this.overlayTarget.classList.remove("hidden")
    }
}