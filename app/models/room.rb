# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ApplicationRecord
  has_many :messages

  validates :name, uniqueness: true,
                   format: { with: /[a-z0-9\-_]/ },
                   presence: true
end
