class ReportsPresenter

  def initialize(date)
    @date = date
  end

  def entries_day
    Entry.where(date: date)
  end

  private

  def date
    @date
  end
  
end
