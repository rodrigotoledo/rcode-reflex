class Code < ApplicationRecord
  default_scope { order(created_at: :desc) }
  validates :code, :user_uuid, :user, presence: true

  after_create_commit { broadcast_prepend_to "codes" }
  after_update_commit { broadcast_update_to "codes" }
  after_destroy_commit { broadcast_remove_to "codes" }

  def self.pick_code
    require 'securerandom'
    Code.create(code: "<p>#{Faker::Name.name}...</p>", user_uuid: SecureRandom.uuid, user: Faker::Internet.email)
  end
end
