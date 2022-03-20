# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :title, presence: true, uniqueness: true
end
