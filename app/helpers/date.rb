helpers do
  def event_form_action(potluck)
    potluck.persisted? ? "/potlucks/#{potluck.id}" : "/potlucks"
  end

  def long_form_date(timestamp)
    timestamp.strftime("%B %e, %Y at %I:%M%p")
  end

  def date_input_format(datetime)
    return "" unless datetime

    datetime.strftime("%m/%d/%Y")
  end

  def time_input_format(datetime)
    return "" unless datetime

    datetime.strftime("%I:%M %P")
  end

  def submit_button_value(potluck)
    potluck.persisted? ? "Update Potluck" : "Create Potluck"
  end
end


