class EntriesController < ApplicationController

  def new
    @categories = Category.order("LOWER(name)")
  end

  def create
  end
end
