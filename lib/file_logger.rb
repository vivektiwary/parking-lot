class FileLogger
  def initialize(manager)
    @manager = manager
  end

  def log
    return manager.next_logger unless should_process?
  end

  private

  def should_process?
    false
  end

  attr_reader :manager
end
