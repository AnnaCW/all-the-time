class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :entries

  def entries_day(date)
    entries.where(date: date)
  end

  def categories_times_day(date)
    entries_day(date).group(:category_id).sum(:value)
  end
end
