require_relative './console_logger'
require_relative './file_logger'

class Logger
  AVAILABLE_LOGGERS = [
    'ConsoleLogger',
    'FileLogger'
  ]

  def initialize
    @loggers = []
    @current_logger_number = 0

    initialize_loggers
  end

  def next_logger
    @current_logger_number += 1
    log
  end

  def logger
    @loggers[current_logger_number]
  end

  def log(string)
    logger.log(string)
  end

  private

  def initialize_loggers
    AVAILABLE_LOGGERS.each do |logger|
      Kernel.const_get(logger).new(self)
    end
  end
end
