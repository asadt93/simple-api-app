# frozen_string_literal: true

module Api
  class CoursesController < ApiController
    before_action :set_course, only: %i[show update destroy]
    # before_action :authenticate_user

    def index
      courses = Course.all
      render json: CourseSerializer.new(courses, set_options).serialized_json
    end

    def show
      render json: CourseSerializer.new(@course, set_options).serialized_json
    end

    def create
      run Course::Operation::Create do |result|
        return render json: CourseSerializer.new(result[:course], set_options).serialized_json
      end
      render_error(result[:model])
    end

    def update
      run Course::Operation::Update do |result|
        return render json: CourseSerializer.new(result[:course], set_options).serialized_json
      end
      render_error(result[:model])
    end

    def destroy
      @course.destroy!
      head :no_content
    end

    private

    # share common setup between actions.
    def set_course
      @course = Course.find(params[:id])
    end
  end
end
