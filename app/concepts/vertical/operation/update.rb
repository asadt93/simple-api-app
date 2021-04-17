# frozen_string_literal: true

module Vertical::Operation
  class Update < Trailblazer::Operation
    step Shared::Callable::ExtractParams
    step :find_vertical!
    step :update_vertical!

    def find_vertical!(options, vertical_id:, **)
      options[:vertical] = Vertical.find(vertical_id)
    end

    def update_vertical!(options, vertical:, **)
      vertical_attributes = options[:vertical_attributes]
      vertical.assign_attributes(vertical_attributes)
      options[:model] = vertical
      return true if vertical.save

      false
    end
  end
end
