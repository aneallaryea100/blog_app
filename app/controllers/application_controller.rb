class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  def current_user
    User.first
  end
end
