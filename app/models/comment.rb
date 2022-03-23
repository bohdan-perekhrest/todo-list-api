# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_one_attached :image

  validates :body, presence: true, length: { minimum: 10, maximum: 256 }
  validates :image, length: { is: 1 }, allow_blank: true
end
