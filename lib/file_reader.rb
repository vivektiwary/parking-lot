class FileReader
  def initialize(file)
    @file = file
  end

  def readlines(&block)
    File.open(file).readlines.each do |line|
      yield(line) if block
    end
  end

  private

  attr_reader :file
end
