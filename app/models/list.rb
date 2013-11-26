class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  attr_accessible :description, :timestamps, :user_id
end
