helpers do
  def print_errors(instance, attribute)
    if instance.errors[attribute].length > 0
      "<p style='color:red'>#{attribute.to_s.capitalize} #{instance.errors[attribute].first}</p>"
    end
  end
end
