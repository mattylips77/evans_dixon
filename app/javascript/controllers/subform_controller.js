// src/controllers/subform_controller.js
import {Controller} from "@hotwired/stimulus"
export default class extends Controller {
    static targets = ["button", "savedForms", "overlay", "subformbody", "subform_list"];

    stopPropigation = (e) => {
        e.stopPropagation()
    }

    initialize = async () => {
        try {
            const response = await fetch('/client_data_entries/111/sub_form_list');
            if (response.ok) {
                const subformlistHtml = await response.text()
                this.subform_listTarget.innerHTML = subformlistHtml
            }
        } catch (error) {
            console.error("Fetch error:", error);
        }
    }

    closeOverlay = (e) => {
        e.stopPropagation();
        this.overlayTarget.classList.add("hidden")
    }

    editForm = async (e) => {
        e.preventDefault()
        const url = `/client_data_entries/${e.currentTarget.dataset.subformid}/sub_form`
        this.openOverlay(url)
    }

    addForm = async (e) => {
        e.preventDefault();
        const url =
    }

    openOverlay = async (url) => {
        try {
            const response = await fetch(url);
            if (response.ok) {
                const subformHtml = await response.text()
                this.subformbodyTarget.innerHTML = subformHtml
            }

        } catch (error) {
            console.error("Fetch error:", error);
        }

        this.overlayTarget.classList.remove("hidden")
    }

    updateFormList = async () => {

    }
}