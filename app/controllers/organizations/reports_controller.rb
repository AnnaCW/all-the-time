class Organizations::ReportsController < ApplicationController

  def index
    end_date = report_params[:date]
    @org_users = User.where(organization_id: params[:organization_id])
  end

private
  def report_params
    params.require(:q).permit(:date)
  end
end
