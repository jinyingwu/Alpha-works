require "byebug"
class Dictionary
  attr_accessor :entries, :keywords

  def initialize
    #@entries = Hash.new(nil)
    @entries = {}
    @keywords = []
  end

  def add(arg)
    #@entries = Hash.new(nil)
    if arg.class == String
      @entries = {arg => nil}
      @keywords << arg
    else
#byebug
      arg.each do |k, v|
        @entries[k] = v
        @keywords << k
      end

        @keywords.sort!
        #byebug
    end
  end

  def include?(arg)
    @keywords.include?(arg)
  end

  def find(arg)
    #byebug
    result = []
    hsh = {}
    @keywords.each do |ele|
      if ele.include?(arg)
        result << ele
      end
    end

    result.each do |ele|
      hsh[ele] = @entries[ele]
    end

    hsh
  end

  def printable
    entries = keywords.map do |keyword|
      %Q{[#{keyword}] "#{@entries[keyword]}"}
    end

    entries.join("\n")
  end
end
