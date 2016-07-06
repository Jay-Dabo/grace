class Giving < ActiveRecord::Base
  belongs_to :church
  belongs_to :member
end
