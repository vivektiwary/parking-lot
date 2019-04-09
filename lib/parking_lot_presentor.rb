class ParkingLotPresentor
  attr_reader :parking_lot, :writer

  def initialize(parking_lot, writer)
    @parking_lot = parking_lot
    @writer = writer
  end

  def print_status
    print_keys
    str = '%<slot_num>s         %<reg_num>s        %<color>s'

    Slot.occupied_slots(parking_lot.slots).each do |slot|
      formatted_str = format(
        str,
        slot_num: slot.number,
        reg_num: slot.car.registration_number,
        color: slot.car.color
      )
      writer.write(formatted_str)
    end
  end

  private

  def print_keys
    writer.write(initial_string)
  end

  def initial_string
    str = '%<slot>s  %<reg_num>s    %<colour>s'
    format(str, slot: 'Slot No.', reg_num: 'Registration No', colour: 'Colour')
  end
end
