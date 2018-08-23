# Options Hashes
#
# Write a method `transmogrify` that takes a `String`. This method should
# take optional parameters `:times`, `:upcase`, and `:reverse`. Hard-code
# reasonable defaults in a `defaults` hash defined in the `transmogrify`
# method. Use `Hash#merge` to combine the defaults with any optional
# parameters passed by the user. Do not modify the incoming options
# hash. For example:
#
# ```ruby
# transmogrify("Hello")                                    #=> "Hello"
# transmogrify("Hello", :times => 3)                       #=> "HelloHelloHello"
# transmogrify("Hello", :upcase => true)                   #=> "HELLO"
# transmogrify("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
#
# options = {}
# transmogrify("hello", options)
# # options shouldn't change.
# ```

def transmogrify(str, options = {})
  defaults = {times: 0, upcase: false, reverse: false}

  options = defaults.merge(options)

  i = 1
  str2 = str
  while i < options[:times]
    str += str2
    i += 1
  end

  if options[:upcase] == true
    str = str.upcase
  end

  if options[:reverse] == true
    str = str.reverse
  end

  str
end
