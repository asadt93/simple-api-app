# frozen_string_literal: true

module Api
  class UsersController < ApiController
    before_action :set_category, only: %i[show edit update destroy]

    private
    # share common setup between actions.
    def set_category
      @category = Category.find(params[:id])
    end
  end
end
