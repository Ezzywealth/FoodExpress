class Users::PasswordsController < Devise::PasswordsController
  include RackSessionsFix
  respond_to :json

  # Other actions...

  # PUT /resource/password
  def update
    if password_params[:password].blank?
      render json: {
        status: { code: 403, message: "Password cannot be blank." }
      }, status: :unprocessable_entity
      return

    elsif password_params[:password_confirmation].blank?
      render json: {
        status: { code: 403, message: "Password confirmation cannot be blank." }
      }, status: :unprocessable_entity
      return

    elsif password_params[:current_password].blank?
      render json: {
        status: { code: 403, message: "Current Password cannot be blank." }
      }, status: :unprocessable_entity
      return

    elsif password_params[:password] != password_params[:password_confirmation]
      render json: {
        status: { code: 403, message: "Password and password confirmation do not match." }
      }, status: :unprocessable_entity
      return

    elsif password_params[:password].length < 8
      render json: {
        status: { code: 403, message: "Password must be at least 8 characters long." }
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
          status: { message: "Password could not be updated." }
        }, status: :unprocessable_entity
      end
    else
      # Handle the case when the current password provided is incorrect
      render json: {
        status: { code: 403, message: "Current password is incorrect." }
      }, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end
