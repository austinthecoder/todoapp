class Todo < ActiveRecord::Base

  attr_accessible :description

  delegate :to_s, :to => :description

end