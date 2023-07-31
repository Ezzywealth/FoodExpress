## Password Update

- send a PUT method to api/v1/password
<!-- params = {
  user:{
    password: newPassword,
    current_password: oldPassword,
    password_confirmation: newPassword
  }
} -->

## Password Reset

- send a POST method to /api/v1/password
<!-- params = {
  user:{
    email
  }
} -->
- a confirmation link with the reset token will be sent back, extract the reset_password_token and make another request
<!-- params = {
  user: {
    reset_password_token,
    password,
    password_confirmation,
    email

  }
} -->
