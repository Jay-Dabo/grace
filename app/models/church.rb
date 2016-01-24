class Church < ActiveRecord::Base
  belongs_to :user

  validates :name, :denomination, presence: true
end
