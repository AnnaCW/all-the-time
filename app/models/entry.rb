class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :user
  validates_presence_of :value
  validates_numericality_of :value
end
