module AuthenticatedAdmin
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :authenticate_admin!, only: [ :create ]
  end
end
