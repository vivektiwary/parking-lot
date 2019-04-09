require_relative 'lib/reader'
require_relative 'lib/console_writer'
require_relative 'lib/parking_lot_manager'

@reader = if ARGV.length.positive?
            Reader.new(ARGV[0], Reader::FILE)
          else
            Reader.new('console')
          end
@writer = ConsoleWriter.new

@manager = ParkingLotManager.new(@reader, @writer)
@manager.start
