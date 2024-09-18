// src/controllers/subform_controller.js
import {Controller} from "@hotwired/stimulus"
export default class extends Controller {
    static targets = ["button", "savedForms", "subform_list", "overlay", "subformbody"];

    stopPropigation = (e) => {
        e.stopPropagation()
    }

    initialize = () => {
        this.loadSubforms();
    }

    newForm = async (e) => {
        const csrfToken =  document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        const url = `/client_legal_forms`
        const data = {
            client_id: 1,
            legal_form_id: 4,
            subFormQuestion_id: 111
        }
        const params = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // Send JSON data
                'X-CSRF-Token': csrfToken,  // Include the CSRF token in the headers
            },
            body: JSON.stringify(data),
        }
        this.openOverlay(url, params)
        e.preventDefault();
    }

    showForm = async (e) => {
        e.preventDefault()
        const url = `/client_data_entries/${e.currentTarget.dataset.subformid}/sub_form`
        const params = {
            method: 'GET'
        }
        this.openOverlay(url, params)
    }

    updateForm = async (e) => {
        e.preventDefault()
        console.log(e)
    }

    deleteForm = async (e) => {
        e.preventDefault()
        const csrfToken =  document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        try {
            const response = await fetch(`/client_legal_forms/${e.currentTarget.dataset.subformid}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json', // Send JSON data
                    'X-CSRF-Token': csrfToken,  // Include the CSRF token in the headers
                },
                body: JSON.stringify({stimulus: true})
            })
            console.log(response)

            this.loadSubforms();
        } catch (error) {
            console.error("Fetch error:", error);
        }
    }

    openOverlay = async (url, params) => {
        try {
            const response = await fetch(url, params);
            if (response.ok) {
                const subformHtml = await response.text()
                this.subformbodyTarget.innerHTML = subformHtml
            }

        } catch (error) {
            console.error("Fetch error:", error);
        }

        this.overlayTarget.classList.remove("hidden")
    }

    loadSubforms = async () => {
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
        this.loadSubforms();
        this.overlayTarget.classList.add("hidden")
    }

    updateFormList = async () => {

    }
}