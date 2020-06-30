class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :profile])
    # アカウント編集の時にストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :profile])
  end

  def check_guest
    email = resource&.email || params[:member][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end
end
