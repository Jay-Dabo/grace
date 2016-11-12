# == Schema Information
#
# Table name: givings
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  member_id      :integer
#  amount         :decimal(, )
#  date_given     :date
#  giving_type_id :integer
#  church_id      :integer
#

class Giving < ActiveRecord::Base
  belongs_to :church
  belongs_to :member
  belongs_to :giving_type

  validates :church_id, :member_id, :giving_type_id, :amount, :date_given,
    presence: true

    def self.search(search)
      if search
        joins(:member).where('LOWER(members.first_name) LIKE :search OR LOWER(members.last_name) LIKE :search', search: "%#{search.downcase}")
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
