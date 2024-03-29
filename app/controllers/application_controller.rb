class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end



  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) # 注目
  end



end

class ApplicationController < ActionController::Base
  before_action :set_custom_css

  private

  def set_custom_css
    @custom_css = "application"
  end
end