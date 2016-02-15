class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    permitted_parameters = devise_parameter_sanitizer.instance_values['permitted']
    [:sign_up, :account_update].each do |devise_action|
      permitted_parameters[devise_action] << :operating_thetan
      permitted_parameters[devise_action] << :favorite_color
      permitted_parameters[devise_action] << {
        profile_attributes: [:other_field],
        owner_attributes: [:other_field, :owner_type]
      }
    end
  end
end
