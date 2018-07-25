# == Schema Information
#
# Table name: giving_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  church_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GivingType < ActiveRecord::Base
  belongs_to :church
  has_many :givings, dependent: :destroy

  validates :church_id, :name, presence: true

  include PgSearch
  pg_search_scope :search_giving_types, against: :name

  def self.search(search)
    if search
      search_giving_types(search)
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
