class UsersController < ApplicationController
  def index; end

  def show
    params[:users_id]
  end
end
