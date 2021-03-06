# == Schema Information
#
# Table name: members
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  first_name   :string
#  gender       :string
#  church_id    :integer
#  email        :string
#  phone        :string
#  member_image :string
#  birthday     :date
#  address      :string
#  city         :string
#  state        :string
#  postal_code  :string
#  last_name    :string
#  interest     :text
#

class Member < ApplicationRecord
  belongs_to :church
  has_many :givings, dependent: :destroy
  has_many :group_members
  mount_uploader :member_image, MemberUploader

  validates :church_id, :first_name, :last_name, :email, :phone,
    presence: true
  validates :email, uniqueness: true

  include PgSearch
  pg_search_scope :search_members, against: [:first_name, :last_name, :email], using: { tsearch: { any_word: true } }

  ValidGenders = %w[N/A female male]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.address}<br/>#{self.city}, #{self.state} #{self.postal_code}".html_safe
  end

  def self.search(search)
    if search
      search_members(search)
    else
      all
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |row|
        csv << row.attributes.values_at(*column_names)
      end
    end
  end

end
