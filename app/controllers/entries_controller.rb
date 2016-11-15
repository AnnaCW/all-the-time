class EntriesController < ApplicationController

  def index
    @entries = Entry.where(user: current_user).order(:date).reverse
  end

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

  def edit
    @entry = Entry.find(params[:id])
    @categories = Category.order("LOWER(name)")
  end

  def update
    entry = Entry.find(params[:id])
    entry.update(entry_params)

    if entry.save
      flash[:notice] = "Entry Updated!"
    else
      flash[:notice] = entry.errors.full_message.join(", ")
    end
      redirect_to entries_path
  end

  def destroy
    (Entry.find(params[:id])).delete
    flash[:notice] = "Entry Deleted!"
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:value, :date, :category_id, :description)
  end
end
