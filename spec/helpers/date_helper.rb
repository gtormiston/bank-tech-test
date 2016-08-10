def get_current_date
  date = Time.new
  date = date.day.to_s + "/" + date.month.to_s + "/" + date.year.to_s
end
