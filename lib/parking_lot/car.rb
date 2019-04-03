class Car
  attr_reader :registration_number, :color

  def initialize(registration_number, color)
    @registration_number = registration_number
    @color = color
  end
end
