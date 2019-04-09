require_relative './parking_lot'
require_relative './car'

class ParkingLotManager
  attr_reader :reader, :writer, :parking_lot

  def initialize(reader, writer)
    @reader = reader
    @writer = writer
  end

  def start
    reader.readlines do |line|
      execute_command(line)
    end
  end

  def execute_command(input)
    tokens = input.split(' ')
    case tokens[0]
    when 'create_parking_lot'
      @parking_lot = ParkingLot.new(tokens[1], writer)
    when 'park'
      car = Car.new(tokens[1], tokens[2])
      parking_lot.park(car)
    when 'leave'
      parking_lot.leave(tokens[1])
    when 'status'
      parking_lot.status
    when 'registration_numbers_for_cars_with_colour'
      parking_lot.registration_numbers_for_cars_with_colour(tokens[1])
    when 'slot_numbers_for_cars_with_colour'
      parking_lot.slot_numbers_for_cars_with_colour(tokens[1])
    when 'slot_number_for_registration_number'
      parking_lot.slot_number_for_registration_number(tokens[1])
    end
  end
end
