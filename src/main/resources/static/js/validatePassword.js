    function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;
            var message = document.getElementById("passwordMessage");
            var submitButton = document.getElementById("submitBtn");

            if (password === confirmPassword) {
                message.style.color = "green";
                message.innerHTML = "密碼一致";
                submitButton.disabled = false;
            } else {
                message.style.color = "red";
                message.innerHTML = "密碼不一致";
                submitButton.disabled = true;
            }
        }