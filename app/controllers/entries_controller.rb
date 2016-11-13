class EntriesController < ApplicationController

  def new
    @categories = Category.order("LOWER(name)")
  end

  def create
    user = current_user
    entry = user.entries.create(entry_params)

    if entry.save
      flash[:notice] = "Entry Saved!"
    else
      flash[:notice] = entry.errors.full_messages.join(", ")
    end
      redirect_to root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:value, :date, :category_id, :description)
  end
end
