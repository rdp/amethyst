
import org.jruby.*;
import org.jruby.javasupport.JavaEmbedUtils;  
import java.util.ArrayList;

public class RubyFromJava {
	static RubyFromJava globalRFJ;
	
	public String fooString() {
		return "foo";
	}
	
	public static void main(String[] ARGV) {
		System.out.println("Started");
		RubyFromJava sTest = new RubyFromJava();
		
		System.out.println("boring: " + sTest.fooString() + "\n");
		
		String script = 
			"require 'java'\n" +
			"class RSubclass < Java::RubyFromJava\n" + // subclassing non java.* requires you prefix the class with Java::
			"	def fooString\n" +
			"		return super + 'BAR!'\n" +
			"	end\n" +
			"end";
      
                Ruby runtime = JavaEmbedUtils.initialize(new ArrayList());
                RubyRuntimeAdapter evaler = JavaEmbedUtils.newRuntimeAdapter();

		evaler.eval(runtime, script);
      
		Object rfj = evaler.eval(runtime, "RSubclass.new()");
		rfj = org.jruby.javasupport.JavaEmbedUtils.rubyToJava(runtime, (org.jruby.runtime.builtin.IRubyObject) rfj, RubyFromJava.class);
                // rubyToJava basically tries to convert a ruby object to its "raw" native java object.  If it's a class then it will pass out a dynamic proxy handler that intercepts calls and directs them to the ruby class (if implemented) or otherwise to the internal java class which is actually an internal element within the ruby class (like ruby's GetDataStruct).
		System.out.println("Local: " + ((RubyFromJava) rfj).fooString() + "\n"); // outputs fooBAR!
	}
}