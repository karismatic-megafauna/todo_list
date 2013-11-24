class UserInfo < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :user_id
  belongs_to :user
end
