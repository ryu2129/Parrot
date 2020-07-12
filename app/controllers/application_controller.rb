class ApplicationController < ActionController::Base

  #authorize_resource

  def current_ability
    #binding.pry
    @current_ability ||= Ability.new(current_member)
  end

  #rescue_from CanCan::AccessDenied do |exception|
    # root_urlにかっ飛ばす。
    #redirect_to root_path
  #end

  def authenticate_member
    if current_member == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def forbid_login_member
    if current_member
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts")
    end
  end

  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    posts_path
  end
  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path
  end

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
