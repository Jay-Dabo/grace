# == Schema Information
#
# Table name: givings
#
#  id             :bigint(8)        not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  member_id      :integer
#  amount         :decimal(, )
#  date_given     :date
#  giving_type_id :integer
#  church_id      :integer
#

class Giving < ApplicationRecord
  belongs_to :church
  belongs_to :member
  belongs_to :giving_type

  validates :church_id, :member_id, :giving_type_id, :amount, :date_given,
    presence: true

  include PgSearch
  pg_search_scope :search_givings, associated_against: { member: [:first_name, :last_name], giving_type: [:name] }

  def self.search(search)
    if search
      search_givings(search)
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
