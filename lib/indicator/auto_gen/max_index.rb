# Ta-Lib function mapping class 
# Function: 'MAXINDEX'
# Description: 'Index of highest value over a specified period'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::MaxIndex
  include Indicator::DataMapper

  # Time Period <Integer>
  attr_accessor :time_period

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @time_period = h[:time_period] || 30
    else
      @time_period = args[0] || 30 
    end
    
    @func = TaLib::Function.new("MAXINDEX")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :time_period ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_integer ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @time_period)

    out_integer = Array.new(len)
    @func.out_int(0, out_integer)
  
    @func.call(0, len - 1)

    out_integer
  end
end
