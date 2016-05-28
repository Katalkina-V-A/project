class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_app_auth
  before_action :load_current_user

  private
  def not_authenticated
    redirect_to login_path, alert: "Сначала войдите в систему!"
  end

  def load_current_user
    @current_user = current_user
  end

  def check_app_auth
    render_error unless @current_user
  end

  def check_admin
    render_error unless @current_user.try(:is_admin?)
  end

  def render_error(message = 'Доступ запрещен!', options = {})
    flash[:danger] = message
    url = options[:url] || root_path
    redirect_to url
  end

  def check_level_one
    render_error unless User.edit_level_one?(@current_user)
  end
  def check_level_two
    render_error unless User.edit_level_two?(@current_user)
  end
  def check_level_three
    render_error unless User.edit_level_three?(@current_user)
  end
  def check_level_four
    render_error unless User.edit_level_four?(@current_user)
  end
  def check_level_five
    render_error unless User.edit_level_five?(@current_user)
  end
  def check_level_six
    render_error unless User.edit_level_six?(@current_user)
  end
  def check_level_seven
    render_error unless User.edit_level_seven?(@current_user)
  end
  def check_level_eight
    render_error unless User.edit_level_eight?(@current_user)
  end
end
