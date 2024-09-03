// src/controllers/subform_controller.js
import {Controller} from "@hotwired/stimulus"
export default class extends Controller {
    static targets = ["button", "savedForms", "overlay", "subform_body"];

    initialize() {
        console.log('stim test')
    }

    closeOverlay = (e) => {
        this.overlayTarget.classList.add("hidden")
    }

    addForm = (e) => {
        e.preventDefault()
        try {
            const response = await fetch(formElement.action, {
                method: 'POST',
                headers: { "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content") },
                body: formData,
            });

        } catch (error) {
            console.error("Fetch error:", error);
        }

        this.overlayTarget.classList.remove("hidden")
    }
}