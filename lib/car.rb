class Car
  attr_reader :registration_number, :color
  attr_accessor :slot_number

  def initialize(registration_number, color)
    @registration_number = registration_number
    @color = color
    @slot_number = nil
  end

  def self.find_all_with_color(cars, color)
    cars.select { |car| car.color == color }
  end

  def self.find_all_with_registraion_number(cars, reg_number)
    cars.select { |car| car.registration_number == reg_number }
  end
end
