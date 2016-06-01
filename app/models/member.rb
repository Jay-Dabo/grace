# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  first_name   :string(255)
#  gender       :string(255)
#  church_id    :integer
#  email        :string(255)
#  phone        :string(255)
#  member_image :string(255)
#  birthday     :date
#  address      :string(255)
#  city         :string(255)
#  state        :string(255)
#  postal_code  :string(255)
#  last_name    :string(255)
#  interest     :text(65535)
#

class Member < ActiveRecord::Base
  belongs_to :church
  mount_uploader :member_image, MemberUploader

  validates :first_name, :last_name, presence: true

  ValidGenders = %w[N/A female male]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.address}<br/>#{self.city}, #{self.state} #{self.postal_code}".html_safe
  end
end
