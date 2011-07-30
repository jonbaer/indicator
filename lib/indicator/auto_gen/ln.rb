# Ta-Lib function mapping class 
# Function: 'LN'
# Description: 'Vector Log Natural'
# This file has been autogenerated - Do Not Edit.
class Ln
  include DataMapper


  def initialize(*args)
    
    @func = TaLib::Function.new("LN")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [  ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_real ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))


    out_real = Array.new(len)
    @func.out_real(0, out_real)
  
    @func.call(0, len - 1)

    out_real
  end
end
