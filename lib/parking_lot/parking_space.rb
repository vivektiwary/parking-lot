require_relative './slot'

class ParkingSpace
  attr_reader :slots

  def initialize(slot_count)
    @slots = []
    initialize_slots(slot_count)
  end

  private

  def initialize_slots(slot_count)
    slot_count.times do |index|
      @slots << Slot.new(index)
    end
  end
end
