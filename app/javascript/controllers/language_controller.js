// app/javascript/controllers/language_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Language controller connected");
  }

  change(event) {
    event.preventDefault();

    const locale = event.currentTarget.dataset.locale;
    console.log("Change locale to: ", locale);

    const token = document.querySelector('meta[name="csrf-token"]').content;

    fetch("/change_locale", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": token,
        Accept: "text/vnd.turbo-stream.html, text/html, application/json",
      },
      body: JSON.stringify({ locale: locale }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.redirect_path) {
          Turbo.visit(data.redirect_path);
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
}
