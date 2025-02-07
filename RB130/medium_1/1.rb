class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record yield if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
p listener.listen { "Hello World!" }
p listener.listen
p listener.play # Outputs "Hello World!"