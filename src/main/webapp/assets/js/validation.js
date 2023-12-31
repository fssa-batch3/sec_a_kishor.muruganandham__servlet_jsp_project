function togglePasswordVisibility(inputId, togglerId) {
  const input = document.getElementById(inputId);
  const toggler = document.querySelector(togglerId);

  toggler.classList.toggle("bi-eye-slash-fill");
  input.type = input.type === "password" ? "text" : "password";
}

function validateUsername(userNameInputId, userNameErrorId) {
  const usernameInput = document.getElementById(userNameInputId);
  const usernameValue = usernameInput.value.trim();
  const emailError = document.querySelector(userNameErrorId);

  const emailFormat = /^\S+@\S+\.\S+$/;
  if (emailFormat.test(usernameValue)) {
    usernameInput.classList.remove("invalid");
    usernameInput.classList.add("valid");
    emailError.style.display = "none";
  } else {
    usernameInput.classList.remove("valid");
    usernameInput.classList.add("invalid");
    emailError.style.display = "inline-block";
  }
}

function handleInputEvent(event, validationFunction) {
  const inputElement = event.target;
  inputElement.value = inputElement.value.trim();
}

document.getElementById('confirm-password-sign-up').addEventListener('input', (event) => {
  handleInputEvent(event, validatePassword);
});

document.getElementById('password-sign-up').addEventListener('input', (event) => {
  handleInputEvent(event, validateConfirmPassword);
});
document.getElementById('password-sign-in').addEventListener('input', (event) => {
  handleInputEvent(event, validateConfirmPassword);
});

function validateConfirmPassword(
  confirmPasswordInputId,
  errorId,
  passwordInputId
) {
  const confirmPasswordInput = document.getElementById(confirmPasswordInputId);
  const confirmPasswordValue = confirmPasswordInput.value.trim();
  const errorElement = document.querySelector(errorId);
  const passwordInput = document.getElementById(passwordInputId);
  const passwordValue = passwordInput.value.trim();

  if (confirmPasswordValue === "") {
    errorElement.textContent = "Confirm password cannot be empty";
    errorElement.style.display = "inline-block";
    confirmPasswordInput.classList.add("invalid");
  } else if (confirmPasswordValue !== passwordValue) {
    errorElement.textContent = "Passwords do not match";
    errorElement.style.display = "inline-block";
    confirmPasswordInput.classList.add("invalid");
  } else {
    errorElement.style.display = "none";
    confirmPasswordInput.classList.remove("invalid");
    confirmPasswordInput.classList.add("valid");
  }
}

function validatePassword(passwordInputId, errorMessageId) {
  const passwordInput = document.getElementById(passwordInputId);
  const errorMessageElement = document.querySelector(errorMessageId);
  const passwordValue = passwordInput.value.trim();

  if (passwordValue === "") {
    showErrorMessage("Password cannot be empty");
  } else if (!isPasswordValid(passwordValue)) {
    showErrorMessage(
      "Your password must be at least 8 characters, contain at least one letter and one digit, and should not contain any whitespace characters."
    );
  } else {
    errorMessageElement.style.display = "none";
    passwordInput.classList.remove("invalid");
    passwordInput.classList.add("valid");
  }

  function showErrorMessage(message) {
    errorMessageElement.textContent = message;
    errorMessageElement.style.display = "inline-block";
    passwordInput.classList.add("invalid");
  }

  function isPasswordValid(password) {
    return (
      password.trim() === password &&
      password.length >= 8 &&
      /[a-z]/i.test(password) &&
      /\d/.test(password) &&
      !/\s/.test(password)
    );
  }
}
