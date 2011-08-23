module ApplicationHelper

  def rounded_population(population)
    number_with_delimiter((population / 100.0).round * 100)
  end

end
