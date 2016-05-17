# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#

# Represents a single message posted to a chatroom
class Message < ApplicationRecord
  after_create_commit :broadcast_message

  belongs_to :room

  validates :room,    presence: true
  validates :content, presence: true

  def humanized_time
    created_at.to_formatted_s(:long_ordinal)
  end

  protected

  def broadcast_message
    MessageBroadcastJob.perform_later self, room: room.name
  end
end
