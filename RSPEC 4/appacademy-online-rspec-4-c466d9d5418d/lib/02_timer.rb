class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end
  def time_string
    hrs = (@seconds / 3600) % 60
    mins = (@seconds / 60) % 60
    secs = @seconds % 60
    if(hrs < 10)
      hrs = "0" + hrs.to_s
    end
    if(mins < 10)
      mins = "0" + mins.to_s
    end
    if(secs < 10)
      secs = "0" + secs.to_s
    end
    @seconds = hrs.to_s + ":" + mins.to_s + ":" + secs.to_s
  end
end
