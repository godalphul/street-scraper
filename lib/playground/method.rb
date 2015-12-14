module Logger
  extend self

  attr_accessor :output

  def log(msg)
    output << "#{msg}\n"
  end
end

class User
  def initialize(id)
    @id = id
    Logger.log("Created User with ID #{id}")
  end
end


Logger.output = ""
1000.times { |i| User.new(i) }

GC.start

# (*): I expected below to be 0, but GC clearly ran. Weird.
p ObjectSpace.each_object(User).count #=> 1