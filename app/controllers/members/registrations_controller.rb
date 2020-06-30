class Members::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end