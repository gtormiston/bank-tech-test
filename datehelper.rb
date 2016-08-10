# understands the date in useful formats
class Datehelper

  def self.get_current
    date = Time.new
    date = date.day.to_s + "/" + date.month.to_s + "/" + date.year.to_s
  end

end
