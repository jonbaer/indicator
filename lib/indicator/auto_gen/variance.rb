# Ta-Lib function mapping class 
# Function: 'VAR'
# Description: 'Variance'
# This file has been autogenerated - Do Not Edit.
class Variance
  include DataMapper

  # Time Period <Integer>
  attr_accessor :time_period
  # Deviations <Double>
  attr_accessor :deviations

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @time_period = h[:time_period] || 5
      @deviations = h[:deviations] || 1.000000e+0
    else
      @time_period = args[0] || 5 
      @deviations = args[1] || 1.000000e+0 
    end
    
    @func = TaLib::Function.new("VAR")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :time_period, :deviations ]
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

    @func.opt_int(0, @time_period)
    @func.opt_real(1, @deviations)

    out_real = Array.new(len)
    @func.out_real(0, out_real)
  
    @func.call(0, len - 1)

    out_real
  end
end
