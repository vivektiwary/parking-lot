require_relative './console_reader'
require_relative './file_reader'

class Reader
  CONSOLE = 'console'.freeze
  FILE = 'file'.freeze

  attr_reader :reader

  def initialize(source, type = CONSOLE)
    @reader = type == CONSOLE ? ConsoleReader.new : FileReader.new(source)
  end

  def read
    reader.read
  end

  def readlines(&block)
    reader.readlines(&block)
  end
end
