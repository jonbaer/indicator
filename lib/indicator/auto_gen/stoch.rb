# Ta-Lib function mapping class 
# Function: 'STOCH'
# Description: 'Stochastic'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::Stoch
  include Indicator::DataMapper

  # Fast-K Period <Integer>
  attr_accessor :fast_k_period
  # Slow-K Period <Integer>
  attr_accessor :slow_k_period
  # Slow-K MA <MA Type>
  attr_accessor :slow_k_ma
  # Slow-D Period <Integer>
  attr_accessor :slow_d_period
  # Slow-D MA <MA Type>
  attr_accessor :slow_d_ma

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @fast_k_period = h[:fast_k_period] || 5
      @slow_k_period = h[:slow_k_period] || 3
      @slow_k_ma = h[:slow_k_ma] || 0
      @slow_d_period = h[:slow_d_period] || 3
      @slow_d_ma = h[:slow_d_ma] || 0
    else
      @fast_k_period = args[0] || 5 
      @slow_k_period = args[1] || 3 
      @slow_k_ma = args[2] || 0 
      @slow_d_period = args[3] || 3 
      @slow_d_ma = args[4] || 0 
    end
    
    @func = TaLib::Function.new("STOCH")
  end

  # Is price data required as an input
  def self.price_input?
    true
  end

  # The list of arguments
  def self.arguments
    [ :fast_k_period, :slow_k_period, :slow_k_ma, :slow_d_period, :slow_d_ma ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :open, :high, :low, :close ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_slow_k, :out_slow_d ]
  end

  def run(*args)
    o, h, l, c, v, len = map_ohlcv(false, *args)
    @func.in_price(0, o, h, l, c, v, nil)

    @func.opt_int(0, @fast_k_period)
    @func.opt_int(1, @slow_k_period)
    @func.opt_int(2, @slow_k_ma)
    @func.opt_int(3, @slow_d_period)
    @func.opt_int(4, @slow_d_ma)

    out_slow_k = Array.new(len)
    @func.out_real(0, out_slow_k)
    out_slow_d = Array.new(len)
    @func.out_real(1, out_slow_d)
  
    @func.call(0, len - 1)

  {:out_slow_k => out_slow_k,
    :out_slow_d => out_slow_d}
  end
end
