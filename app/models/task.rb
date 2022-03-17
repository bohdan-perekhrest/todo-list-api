# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments
  acts_as_list scope: :project
end
