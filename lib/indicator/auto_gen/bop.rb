# Ta-Lib function mapping class 
# Function: 'BOP'
# Description: 'Balance Of Power'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::Bop
  include Indicator::DataMapper


  def initialize(*args)
    
    @func = TaLib::Function.new("BOP")
  end

  # Is price data required as an input
  def self.price_input?
    true
  end

  # The list of arguments
  def self.arguments
    [  ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :open, :high, :low, :close ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_real ]
  end

  def run(*args)
    o, h, l, c, v, len = map_ohlcv(false, *args)
    @func.in_price(0, o, h, l, c, v, nil)


    out_real = Array.new(len)
    @func.out_real(0, out_real)
  
    @func.call(0, len - 1)

    out_real
  end
end
