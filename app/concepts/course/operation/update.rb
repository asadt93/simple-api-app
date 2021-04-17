# frozen_string_literal: true

module Course::Operation
  class Update < ApiOperation
    step Shared::Callable::ExtractParams
    step :find_resources!
    step Wrap(Shared::Callable::DefaultTransaction) {
      step :update_vertical!
      step :update_category!
      step :update_course!
      fail ->(*) { raise ActiveRecord::Rollback }
    }

    def find_resources!(options, course_id:, **)
      vertical_id = options[:vertical_id]
      category_id = options[:category_id]
      options[:vertical] = Vertical.find(vertical_id) unless vertical_id.nil?
      options[:category] = Category.find(category_id) unless category_id.nil?
      options[:course] = Course.find(course_id)
    end

    def update_vertical!(options, **)
      vertical = options[:vertical]
      vertical_attributes = options[:vertical_attributes]
      return true if vertical.nil?

      options[:model] = vertical
      vertical.assign_attributes(vertical_attributes)
      return true if vertical.save

      false
    end

    def update_category!(options, **)
      category = options[:category]
      category_attributes = options[:category_attributes]
      return true if category.nil?

      options[:model] = category
      category.assign_attributes(category_attributes)
      return true if category.save

      false
    end

    def update_course!(options, course:, **)
      course_attributes = options[:course_attributes]

      options[:model] = course
      course.assign_attributes(course_attributes)
      return true if course.save

      false
    end
  end
end
