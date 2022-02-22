class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :parent, class_name: 'Tweet', foreign_key: :parent_id, primary_key: :id, optional: true

  has_one_attached :image
  validates :image, content_type: [:png, :jpg, :jpeg], size: { less_than: 5.megabytes}
end
