require 'parser'
require 'rspec/autorun'

describe Parser do
  
  it "should work with a single digit" do
    Parser.convert_string("2").should == "RubyInt.new(2)"
  end
  
  it "should work with addition" do
    Parser.convert_string("2+3").should == "ImplementsPlusOneArg(RubyInt.new(2)).___plus RubyInt.new(3)"
  end
  
end
