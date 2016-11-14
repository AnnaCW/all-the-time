class UsersController < ApplicationController

  def index
    @org_users = User.where(organization_id: params[:organization_id])
  end

end
