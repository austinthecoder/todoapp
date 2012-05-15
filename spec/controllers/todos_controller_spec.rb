require 'spec_helper'

describe TodosController do

  describe "GET index" do
    it "renders the index template" do
      get :index
      response.should render_template(:index)
    end
  end

  describe "POST create" do
    it "saves the todo" do
      controller.todo.should_receive :save!
      post :create
    end

    it "redirects to the root URL" do
      post :create
      response.should redirect_to(root_url)
    end
  end

  describe "THE_ACCOUNT" do
    it "is an account" do
      described_class::THE_ACCOUNT.should == Account.new
    end
  end

  describe "instance methods" do
    subject { controller }

    describe "todo" do
      it "is a new todo from the account" do
        todo = Object.new
        todo_params = Object.new
        subject.stub(:params) { {:todo => todo_params} }
        subject.stub_chain(:account, :new_todo) do |args|
          todo if todo_params == args
        end
        subject.todo.should == todo
      end
    end

    describe "todos" do
      it "returns the account's todos" do
        todos = Object.new
        subject.stub_chain(:account, :todos) { todos }
        subject.todos.should == todos
      end
    end

    describe "account" do
      it "is the main account" do
        subject.account.should == described_class::THE_ACCOUNT
      end
    end
  end

end