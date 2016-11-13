class ReportsController < ApplicationController

  def index
   
  end

private
  def reading_params
    params.require(:q).permit(:date)
  end
end
