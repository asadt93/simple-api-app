# frozen_string_literal: true

module Api
  class CategoriesController < ApiController
    before_action :set_category, only: %i[show update destroy]
    # before_action :authenticate_user

    def index
      categories = Category.all
      render json: CategorySerializer.new(categories, set_options).serialized_json
    end

    def show
      render json: CategorySerializer.new(@category, set_options).serialized_json
    end

    def create
      run Category::Operation::Create do |result|
        return render json: CategorySerializer.new(result[:category], set_options).serialized_json
      end
      render_error(result[:model])
    end

    def update
      run Category::Operation::Update do |result|
        return render json: CategorySerializer.new(result[:category], set_options).serialized_json
      end
      render_error(result[:model])
    end

    def destroy
      @category.destroy!
      head :no_content
    end

    private

    # share common setup between actions.
    def set_category
      @category = Category.find(params[:id])
    end
  end
end
