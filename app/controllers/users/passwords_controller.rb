class Users::PasswordsController < Devise::PasswordsController
  include RackSessionsFix
  respond_to :json

  # GET /resource/password/new


  # POST /resource/password


  # GET /resource/password/edit?reset_password_token=abcdef


  # PUT /resource/password
  # method to change a user password
  def update
    if current_user.present?
      # User is authenticated, trying to update password using current password
      update_password_with_current_password
    else
      # User is not authenticated, initiating password reset
      initiate_password_reset
    end
  end

  private





  # The path used after sending reset password instructions


  def update_password_with_current_password
    if password_params[:password].blank?
      render json: {
        status: { code: 403, message: 'Password cannot be blank.' }
      }, status: :unprocessable_entity
      return

    elsif password_params[:password_confirmation].blank?
      render json: {
        status: { code: 403, message: 'Password confirmation cannot be blank.' }
      }, status: :unprocessable_entity
      return

    elsif password_params[:password] != password_params[:password_confirmation]
      render json: {
        status: { code: 403, message: 'Password and password confirmation do not match.' }
      }, status: :unprocessable_entity
      return

    elsif password_params[:password].length < 8
      render json: {
        status: { code: 403, message: 'Password must be at least 8 characters long.' }
      }, status: :unprocessable_entity
      return
    end

    self.resource = resource_class.find(current_user.id)

    # Ensure that the user provides their current password for authentication
    if resource.valid_password?(password_params[:current_password])
      # Update the password and other attributes if needed
      resource.update_with_password(password_params)

      if resource.errors.empty?
        # Sign in the user again to update the session with the new password
        sign_in(resource_name, resource, bypass: true)
        render json: {
          status: { code: 200, message: 'Password updated successfully.' }
        }
      else
        # Handle the case when the password update was not successful
        render json: {
          status: { message: 'Password could not be updated.' }
        }, status: :unprocessable_entity
      end
    else
      # Handle the case when the current password provided is incorrect
      render json: {
        status: { code: 403, message: 'Current password is incorrect.' }
      }, status: :unprocessable_entity
    end
  end

  def initiate_password_reset
    if password_params[:password].blank?
      render json: {
        status: { code: 403, message: 'Password cannot be blank.' }
      }, status: :unprocessable_entity
      return
    elsif password_params[:password_confirmation].blank?
      render json: {
        status: { code: 403, message: 'Password confirmation cannot be blank.' }
      }, status: :unprocessable_entity
      return
    elsif password_params[:password] != password_params[:password_confirmation]
      render json: {
        status: { code: 403, message: 'Password and password confirmation do not match.' }
      }, status: :unprocessable_entity
      return
    elsif password_params[:password].length < 8
      render json: {
        status: { code: 403, message: 'Password must be at least 8 characters long.' }
      }, status: :unprocessable_entity
      return
    end

    self.resource = resource_class.find_by(email: password_params[:email])

    if resource.present?
      # if resource.reset_password_token != password_params[:reset_password_token]
      #   render json: {
      #     status: { code: 403, message: "Reset password token is invalid." }
      #   }, status: :unprocessable_entity
      #   return
      # end
      # Update the user's password with the new password provided in the request
      resource.reset_password(password_params[:password], password_params[:password_confirmation])

      if resource.errors.empty?
        render json: {
          status: { code: 200, message: 'Password updated successfully.' }
        }
      else
        # Handle the case when the password update was not successful
        render json: {
          status: { message: 'Password could not be updated.' }
        }, status: :unprocessable_entity
      end
    else
      # Handle the case when the user with the given email does not exist
      render json: {
        status: { code: 403, message: "User with email #{password_params[:email]} does not exist." }
      }, status: :unprocessable_entity
    end
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation, :reset_password_token, :email)
  end
end
