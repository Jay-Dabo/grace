# == Schema Information
#
# Table name: giving_types
#
#  id         :integer          not null, primary key
#  name       :string
#  church_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GivingType < ActiveRecord::Base
  belongs_to :church
  has_many :givings, dependent: :destroy

  validates :church_id, :name, presence: true

  def self.search(search)
    if search
      where('LOWER(name) LIKE :search', search: "%#{search.downcase}")
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
