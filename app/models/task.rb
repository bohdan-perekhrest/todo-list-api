# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments
  acts_as_list scope: :project

  validates :title, :position, presence: true
  validates :done, acceptance: { accept: [true, false] }
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
