class Member < ActiveRecord::Base
  validates :name, :gender, presence: true
end
