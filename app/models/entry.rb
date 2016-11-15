class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :value
  validates_numericality_of :value

  def category_name
    Category.find(category_id).name
  end

end
