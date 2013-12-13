class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  attr_accessible :name, :description, :user_id
  scope :user_id, lambda { where("lists.user_id = ?", current_user.id) }

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end  
end
