class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, church_attributes: [:name, :denomination, :church_image])
    end

    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, church_attributes: [:id, :name, :denomination, :church_image])
    end

  protected
    def after_sign_up_path_for(resource)
      church_path(resource.church_id)
    end

    def after_inactive_sign_up_path_for(resource)
      church_path(resource.church_id)
    end

end
