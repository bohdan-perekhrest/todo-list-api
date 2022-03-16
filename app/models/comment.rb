# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_one_attached :image

  validates :image, length: { is: 1 }, allow_blank: true
end

