class TodosController < ApplicationController

  THE_ACCOUNT = Account.new

  helper_method :todo, :todos

  def create
    todo.save!
    redirect_to root_url
  end


  def todo
    @todo ||= account.new_todo params[:todo]
  end

  def todos
    account.todos
  end

  def account
    THE_ACCOUNT
  end

end
