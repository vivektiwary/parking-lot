class Slot
  attr_reader :number, :car, :filled

  def initialize(number)
    @number = number
    @filled = false
  end

  def add_car(car)
    @car = car
    @filled = true
    car.slot_number = number
  end

  def remove_car
    car.slot_number = nil
    @car = nil
    @filled = false
  end

  def self.cars(slots)
    occupied_slots(slots).map(&:car)
  end

  def self.occupied_slots(slots)
    slots.select { |slot| slot.filled == true }
  end
end
