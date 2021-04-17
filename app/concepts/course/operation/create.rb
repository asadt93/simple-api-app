# frozen_string_literal: true

module Course::Operation
  class Create < ApiOperation
    step Shared::Callable::ExtractParams
    step Wrap(Shared::Callable::DefaultTransaction) {
      step :find_or_create_vertical!
      step :find_or_create_category!
      step :create_course!
      fail ->(*) { raise ActiveRecord::Rollback }
    }

    def find_or_create_vertical!(options, vertical_attributes:, **)
      vertical = Vertical.find_or_initialize_by(vertical_attributes)
      options[:vertical] = vertical
      options[:model] = vertical
      return true if vertical.save

      false
    end

    def find_or_create_category!(options, vertical:, category_attributes:, **)
      attributes = category_attributes.merge(vertical_id: vertical.id)
      category = Category.find_or_initialize_by(attributes)
      options[:model] = category
      options[:category] = category
      return true if category.save

      false
    end

    def create_course!(options, category:, course_attributes:, **)
      attributes = course_attributes.merge(category: category)
      course = Course.new(attributes)
      options[:model] = course
      options[:course] = course
      return true if course.save

      false
    end
  end
end
