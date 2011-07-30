# Ta-Lib function mapping class 
# Function: 'MACDEXT'
# Description: 'MACD with controllable MA type'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::MacdExt
  include Indicator::DataMapper

  # Fast Period <Integer>
  attr_accessor :fast_period
  # Fast MA <MA Type>
  attr_accessor :fast_ma
  # Slow Period <Integer>
  attr_accessor :slow_period
  # Slow MA <MA Type>
  attr_accessor :slow_ma
  # Signal Period <Integer>
  attr_accessor :signal_period
  # Signal MA <MA Type>
  attr_accessor :signal_ma

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @fast_period = h[:fast_period] || 12
      @fast_ma = h[:fast_ma] || 0
      @slow_period = h[:slow_period] || 26
      @slow_ma = h[:slow_ma] || 0
      @signal_period = h[:signal_period] || 9
      @signal_ma = h[:signal_ma] || 0
    else
      @fast_period = args[0] || 12 
      @fast_ma = args[1] || 0 
      @slow_period = args[2] || 26 
      @slow_ma = args[3] || 0 
      @signal_period = args[4] || 9 
      @signal_ma = args[5] || 0 
    end
    
    @func = TaLib::Function.new("MACDEXT")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :fast_period, :fast_ma, :slow_period, :slow_ma, :signal_period, :signal_ma ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_macd, :out_macd_signal, :out_macd_hist ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @fast_period)
    @func.opt_int(1, @fast_ma)
    @func.opt_int(2, @slow_period)
    @func.opt_int(3, @slow_ma)
    @func.opt_int(4, @signal_period)
    @func.opt_int(5, @signal_ma)

    out_macd = Array.new(len)
    @func.out_real(0, out_macd)
    out_macd_signal = Array.new(len)
    @func.out_real(1, out_macd_signal)
    out_macd_hist = Array.new(len)
    @func.out_real(2, out_macd_hist)
  
    @func.call(0, len - 1)

  {:out_macd => out_macd,
    :out_macd_signal => out_macd_signal,
    :out_macd_hist => out_macd_hist}
  end
end
