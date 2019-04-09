require_relative './slot'
require_relative './logger'
require_relative './parking_lot_presentor'

require 'rubygems'
require 'algorithms'

class ParkingLot
  attr_reader :slots, :slot_queue, :writer

  def initialize(slot_count, writer)
    @slots = []
    @writer = writer
    @slot_queue = Containers::PriorityQueue.new
    @presenter = ParkingLotPresentor.new(self, writer)
    initialize_slots(slot_count.to_i)
    writer.write("Created a parking lot with #{slot_count} slots")
  end

  def park(car)
    slot = slot_queue.pop
    raise 'Sorry, parking lot is full' if slot.nil?

    slot.add_car(car)
    writer.write("Allocated slot number #{slot.number}")
  rescue StandardError => error
    writer.write(error.message)
  end

  def leave(slot_number)
    slot_number = slot_number.to_i
    slot = find_slot(slot_number - 1)

    slot.remove_car
    slot_queue.push(slot, slot_number + 1 - slots.length)
    writer.write("Slot number #{slot_number} is free")
  end

  def status
    presenter.print_status
  end

  def registration_numbers_for_cars_with_colour(color)
    cars = Slot.cars(slots)
    reg_nos = Car.find_all_with_color(cars, color).map(&:registration_number)
    writer.write(reg_nos.join(', '))
  end

  def slot_numbers_for_cars_with_colour(color)
    cars = Slot.cars(slots)
    s_nos = Car.find_all_with_color(cars, color).map(&:slot_number)
    writer.write(s_nos.join(', '))
  end

  def slot_number_for_registration_number(reg_number)
    cars = Slot.cars(slots)
    s_nos = Car.find_all_with_registraion_number(cars, reg_number).map(&:slot_number)
    msg = s_nos.length.positive? ? s_nos.join(', ') : 'Not found'
    writer.write(msg)
  end

  private

  def find_slot(slot_number)
    slots[slot_number]
  end

  def initialize_slots(slot_count)
    slot_count.times do |index|
      slot = Slot.new(index + 1)
      @slots << slot
      slot_queue.push(slot, (index + 1 - slot_count).abs)
    end
  end

  attr_reader :presenter
end
