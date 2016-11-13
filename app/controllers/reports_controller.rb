class ReportsController < ApplicationController

  def index
   @dailies = Entry.where(date: report_params[:date])
  end

private
  def report_params
    params.require(:q).permit(:date)
  end
end
