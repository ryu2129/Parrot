class Members::PasswordsController < Devise::PasswordsController
  before_action :check_guest, only: :create
end