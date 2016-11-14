class ReportsPresenter

  def initialize(date, user)
    @date = date
    @user = user
  end

  def entries_day
    Entry.where(user: user, date: date)
  end

  def total_time_day
    entries_day.sum(:value)
  end

  def categories_times_day
    categories = entries_day.pluck(:category_id).uniq
    totals = entries_day.group(:category_id).sum(:value)
  end

  private

  def date
    @date
  end

  def user
    @user
  end

end
