document.addEventListener("DOMContentLoaded", () => {
	
	
	const confirmPassword = document.getElementById("confirmPassword");
	
    const form = document.querySelector(".auth-form");

    const email = document.getElementById("email");
    const password = document.getElementById("password");

    const togglePassword = document.querySelector(".password-toggle");

    /*==========================
        SHOW / HIDE PASSWORD
    ==========================*/

    if (togglePassword) {

        togglePassword.addEventListener("click", () => {

            const icon = togglePassword.querySelector("i");

            if (password.type === "password") {

                password.type = "text";

                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");

            } else {

                password.type = "password";

                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");

            }

        });

    }

    /*==========================
        FORM VALIDATION
    ==========================*/

    form.addEventListener("submit", (e) => {
		
		console.log("Form Submitted");

        let valid = true;

        clearErrors();

        if (email.value.trim() === "") {

            showError(email, "Email is required.");

            valid = false;

        } else if (!isValidEmail(email.value.trim())) {

            showError(email, "Please enter a valid email.");

            valid = false;

        }

        if (password.value.trim() === "") {

            showError(password, "Password is required.");

            valid = false;

        }

        if (!valid) {

            e.preventDefault();

        }

	if(confirmPassword){

	    if(confirmPassword.value.trim()===""){

	        showError(confirmPassword,"Please confirm your password.");

	        valid=false;

	    }
	    else if(password.value!==confirmPassword.value){

	        showError(confirmPassword,"Passwords do not match.");

	        valid=false;

	    }

	}
	
    });
	

    /*==========================
        HELPERS
    ==========================*/

    function isValidEmail(email) {

        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

    }

    function showError(input, message) {

        const group = input.closest(".input-group");

        const error = group.querySelector(".error-text");

        input.classList.add("is-invalid");

        error.textContent = message;

        error.classList.remove("hidden");

    }


    function clearErrors() {

        document.querySelectorAll(".input").forEach(input => {

            input.classList.remove("is-invalid");

        });

        document.querySelectorAll(".error-text").forEach(error => {

            error.classList.add("hidden");

        });

    }

});