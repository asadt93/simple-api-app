# frozen_string_literal: true

module Category::Operation
  class Create < ApiOperation
    step Shared::Callable::ExtractParams
    step Wrap(Shared::Callable::DefaultTransaction) {
      step :find_or_create_vertical!
      step :create_category!
      fail ->(*) { raise ActiveRecord::Rollback }
    }

    def find_or_create_vertical!(options, vertical_attributes:, **)
      vertical = Vertical.find_or_initialize_by(vertical_attributes)
      options[:vertical] = vertical
      options[:model] = vertical
      return true if vertical.save

      false
    end

    def create_category!(options, vertical:, category_attributes:, **)
      attributes = category_attributes.merge(vertical: vertical)
      category = Category.new(attributes)
      options[:model] = category
      options[:category] = category
      return true if category.save

      false
    end
  end
end
