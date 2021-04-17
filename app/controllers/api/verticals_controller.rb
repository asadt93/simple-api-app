# frozen_string_literal: true

module Api
  class VerticalsController < ApiController
    before_action :set_vertical, only: %i[show update destroy]
    # before_action :authenticate_user

    def index
      verticals = Vertical.all
      render json: VerticalSerializer.new(verticals, set_options).serialized_json
    end

    def show
      render json: VerticalSerializer.new(@vertical, set_options).serialized_json
    end

    def create
      run Vertical::Operation::Create do |result|
        return render json: VerticalSerializer.new(result[:vertical], set_options).serialized_json
      end
      render_error(result[:model])
    end

    def update
      run Vertical::Operation::Update do |result|
        return render json: VerticalSerializer.new(result[:vertical], set_options).serialized_json
      end
      render_error(result[:model])
    end

    def destroy
      @vertical.destroy!
      head :no_content
    end

    private

    # share common setup between actions.
    def set_vertical
      @vertical = Vertical.find(params[:id])
    end
  end
end
