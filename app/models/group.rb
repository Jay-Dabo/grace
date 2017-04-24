class Group < ActiveRecord::Base
  belongs_to :church

  validates :name, presence: true
end
