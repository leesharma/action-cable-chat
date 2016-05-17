# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Represents a chatroom focusing on a specific topic or theme
class Room < ApplicationRecord
  has_many :messages

  validates :name, uniqueness: true,
                   format: { with: /\A[a-z0-9\-_]\z/ },
                   presence: true
end
