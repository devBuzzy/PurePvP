class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Techncially, @user is a player, because a forum account
  # may not exist for this user, but is referred to as
  # a @user anyway.
  def profile
    @user = User.find_by(:username => params[:username])

    @kills = @user.kills
    @deaths = @user.deaths

    @encounters = @kills + @deaths
    @encounters.sort_by(&:timestamp).reverse

    if @deaths.count == 0
      @kd = 'N/A'
    else
      @kd = @kills.count / @deaths.count
    end
  end

  # Helper methods

  def forem_user
    current_user
  end
  
  helper_method :forem_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :login, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:uuid, :username, :email, :password, :password_confirmation, :current_password) }
  end
end
