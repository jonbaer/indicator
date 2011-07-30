# Ta-Lib function mapping class 
# Function: 'CDLCOUNTERATTACK'
# Description: 'Counterattack'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::CdlCounterAttack
  include Indicator::DataMapper


  def initialize(*args)
    
    @func = TaLib::Function.new("CDLCOUNTERATTACK")
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
    [ :out_integer ]
  end

  def run(*args)
    o, h, l, c, v, len = map_ohlcv(false, *args)
    @func.in_price(0, o, h, l, c, v, nil)


    out_integer = Array.new(len)
    @func.out_int(0, out_integer)
  
    @func.call(0, len - 1)

    out_integer
  end
end
