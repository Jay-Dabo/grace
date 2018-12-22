# == Schema Information
#
# Table name: groups
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  group_image :string
#  church_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ApplicationRecord
  belongs_to :church
  has_many :group_members, dependent: :destroy
  mount_uploader :group_image, GroupUploader
  #accepts_nested_attributes_for :group_members

  validates :name, presence: true

  include PgSearch
  pg_search_scope :search_groups, against: [:name]

  def self.search(search)
    if search
      search_groups(search)
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
