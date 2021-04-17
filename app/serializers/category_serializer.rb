# frozen_string_literal: true

class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :state
  cache_options enabled: true, cache_length: 2.minutes
  belongs_to :vertical
end
