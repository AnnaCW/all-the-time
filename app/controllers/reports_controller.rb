class ReportsController < ApplicationController

  def index
   end_date = report_params[:date]
   @presenter = ReportsPresenter.new(end_date)
  end

private
  def report_params
    params.require(:q).permit(:date)
  end
end
