# frozen_string_literal: true

module Vertical::Operation
  class Create < ApiOperation
    step Shared::Callable::ExtractParams
    step :create_vertical!

    def create_vertical!(options, vertical_attributes:, **)
      vertical = Vertical.new(vertical_attributes)
      options[:model] = vertical
      options[:vertical] = vertical
      return true if vertical.save

      false
    end
  end
end
