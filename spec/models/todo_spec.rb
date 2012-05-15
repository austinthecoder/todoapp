require 'spec_helper'

describe Todo do

  describe "to_s" do
    it "is it's description" do
      todo = Todo.new :description => "Get to work"
      todo.to_s.should == "Get to work"
    end

    it "is an empty string without a description" do
      todo = Todo.new :description => nil
      todo.to_s.should == ''
    end
  end

end