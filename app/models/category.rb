# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses

  validates :name, uniqueness: true
end
