class Organizations::ReportsController < ApplicationController

  def index
    @end_date = report_params[:date]

    @users_with_entries = User.where(organization_id: params[:organization_id])
    .joins(:entries).where(entries: {date: report_params[:date]}).distinct
  end

private
  def report_params
    params.require(:q).permit(:date)
  end
end
