module LazyLogger
  extend self

  attr_accessor :output

  def log(&callback)
    @log_actions ||= []
    @log_actions << callback
  end

  def flush
    @log_actions.each { |e| e.call(output) }
  end
end

class User
  def initialize(id)
    @id = id
    LazyLogger.log { |out| out << "Created User with ID #{id}" }
  end
end




LazyLogger.output = ""
1000.times { |i| User.new(i) }

GC.start
p ObjectSpace.each_object(User).count #=> 1000