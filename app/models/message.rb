# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  after_create_commit :broadcast_message

  protected

  def broadcast_message
    MessageBroadcastJob.perform_later self
  end
end
