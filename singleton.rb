class Log
  def initialize
    @log = File.new 'log.txt', 'a'
  end

  def log(msg)
    @log.puts msg
  end

  @@instance = Log.new

  def instance
    @@instance
  end

  private_class_method :new
end
