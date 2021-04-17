# frozen_string_literal: true

class Vertical < ApplicationRecord
  has_many :category

  validates :name, uniqueness: true
end
