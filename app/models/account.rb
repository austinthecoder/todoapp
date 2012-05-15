class Account

  def ==(other)
    other.is_a? self.class
  end

  def new_todo(*args)
    Todo.new *args
  end

  def todos
    Todo.order 'created_at DESC'
  end

end