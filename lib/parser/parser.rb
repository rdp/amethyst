require 'stringio'
require 'redparse'

class RedParse
  class LiteralNode
      def unparse o=default_unparse_options
                val=val()
        p val, val.class
        case val 
        when Fixnum
          "RubyInt.new(#{val.inspect})" # my own :P
        when StringNode #ugly hack
          ":"+
            val.unparse(o)
        when Float
          s= val.accurate_to_s
          #why must it be *2? I wouldn't think any fudge factor would be necessary
          case s
          when /-inf/i; s="-"+Inf
          when /inf/i;  s=    Inf
          when /nan/i;  s=    Nan
          else
            fail unless [s.to_f].pack("d")==[val].pack("d")
          end
          s
        else val.inspect
        end

      end
  end
end


# #0:C:/installs/Ruby187/lib/ruby/gems/1.8/gems/redparse-0.8.4/lib/redparse/node.rb:3880:Module:>:         when StringNode #ugly hack


=begin
        when StringNode #ugly hack
          ":"+
            val.unparse(o)
            
            what is this for...
            
=end

class Parser
   def self.convert_string s
      parser=RedParse.new s
      tree=parser.parse
      tree.unparse
    end
end