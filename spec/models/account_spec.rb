require 'spec_helper'

describe Account do

  subject { described_class.new }

  it "is equal to another account" do
    subject.should == Account.new
  end

  it "is not equal to non-accounts" do
    subject.should_not == Object.new
  end

  describe "new_todo" do
    it "returns a todo" do
      subject.new_todo.should be_a(Todo)
      subject.new_todo.should be_new_record
    end

    it "uses the given attrs to set the todo's attrs" do
      attrs = {:description => 'x'}
      todo = subject.new_todo attrs
      todo.description.should == 'x'
    end
  end

  describe "todos" do
    it "returns all todos, newest first" do
      todos = [2, 3, 1].map do |n|
        Todo.new.tap do |t|
          t.created_at = n.hours.ago
          t.save!
        end
      end
      subject.todos.should == [todos[2], todos[0], todos[1]]
    end

    context "when there are no todos" do
      it "is empty" do
        subject.todos.should be_empty
      end
    end
  end

end