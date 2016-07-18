class Giving < ActiveRecord::Base
  belongs_to :church
  belongs_to :member
  has_one :giving_type
end
