class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new


  # POST /resource/confirmation


  # GET /resource/confirmation?confirmation_token=abcdef


  protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    # Define the path where users should be redirected after resending confirmation instructions
    # For example: root_path or new_user_session_path
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    # Define the path where users should be redirected after confirming their email
    # For example: root_path or new_user_session_path
  end
end
