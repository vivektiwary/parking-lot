class ConsoleReader
  def readlines(&block)
    print_command_indicator
    input = gets.chomp

    until input == 'exit'
      yield(input) if block

      print_command_indicator
      input = gets.chomp
    end
  end

  private

  def print_command_indicator
    print '$ '
    STDOUT.flush
  end
end
