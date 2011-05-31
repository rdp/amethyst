require 'rubygems'
require 'stringio'
require 'parser'
require 'rspec/autorun'

describe Parser do
  
  it "should work with a single digit" do
    convert("2").should == "RubyInt.new(2)"
  end
  
  it "should work with addition" do
    convert("2+3").should == "ImplementsPlusOneArg(RubyInt.new(2)).___plus RubyInt.new(3)"
  end
  
  def convert s
     Parser.convert_string s
  end
  
  it "should work with methods" do
     convert("puts 3").should == "puts RubyInt.new(3)"
  end
  
  it "should work with arrays" do
     convert("fib_array = []").should  == "fib_array=RubyArray.new"
     convert("fib_array = [3]").should == "fib_array=RubyArray.new [RubyInt.new(3)]"
  end
  
  # ... go.rb :P
  
  # arbitrary methods
  
end
