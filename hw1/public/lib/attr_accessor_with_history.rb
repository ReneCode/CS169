class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string

    class_eval %Q{

      def #{attr_name}; 
        @#{attr_name} = [nil] if @#{attr_name} == nil;
        @#{attr_name}[-1]; end;

      def #{attr_name}= (arg); 
        @#{attr_name} = [nil] if @#{attr_name} == nil;
        @#{attr_name}.push(arg); 
        end; 

      def #{attr_name+"_history"}; 
        return nil if @#{attr_name} == nil;
        @#{attr_name}[0..-2].collect{|c|c}; 
        end;
    }
  end


end




class TestClass1
  attr_accessor_with_history :foo
end



c = TestClass1.new
#puts(c.foo.class)
c.foo = "hallo"
c.foo = 5 

#puts(c.foo_history)

