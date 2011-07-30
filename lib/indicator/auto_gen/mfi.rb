# Ta-Lib function mapping class 
# Function: 'MFI'
# Description: 'Money Flow Index'
# This file has been autogenerated - Do Not Edit.
class Mfi
  include DataMapper

  # Time Period <Integer>
  attr_accessor :time_period

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @time_period = h[:time_period] || 14
    else
      @time_period = args[0] || 14 
    end
    
    @func = TaLib::Function.new("MFI")
  end

  # Is price data required as an input
  def self.price_input?
    true
  end

  # The list of arguments
  def self.arguments
    [ :time_period ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :open, :high, :low, :close, :volume ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_real ]
  end

  def run(*args)
    o, h, l, c, v, len = map_ohlcv(true, *args)
    @func.in_price(0, o, h, l, c, v, nil)

    @func.opt_int(0, @time_period)

    out_real = Array.new(len)
    @func.out_real(0, out_real)
  
    @func.call(0, len - 1)

    out_real
  end
end
