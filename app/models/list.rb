class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  attr_accessible :name, :description, :user_id
end
