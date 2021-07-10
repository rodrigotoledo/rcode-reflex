class Code < ApplicationRecord
  default_scope { order(created_at: :desc) }
  validates :code, :user_uuid, :user, presence: true

  after_create_commit :broadcast_later
  after_update_commit :broadcast_later
  after_destroy_commit { broadcast_remove_to "codes" }

  def self.pick_code
    require 'securerandom'
    Code.create(code: "<p>#{Faker::Name.name}...</p>", user_uuid: SecureRandom.uuid, user: Faker::Internet.email)
  end

  def broadcast_later
    broadcast_replace_to "codes", partial: "codes/detail", locals: {code: self}, target: "code_detail_#{self.id}"
    broadcast_replace_to "codes"
  end

  def pix!
    self.code = Faker::Name.name
    self.user = Faker::Internet.email
    self.save
  end
end
