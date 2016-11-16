class CategoriesController < ApplicationController

  def index
    @categories = Category.order("LOWER(name)")
  end

  def create
    category = Category.create(category_params)
      if category.save
        flash[:notice] = "Category Created!"
      else
        flash[:notice] = category.full_messages.join(", ")
      end
      redirect_back(fallback_location: categories_path)
      # redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
