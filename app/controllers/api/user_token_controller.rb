module Api
  class UserTokenController < Knock::AuthTokenController
    protect_from_forgery

    private

    def authenticate
      unless entity.present? && entity.authenticate(auth_params[:password])
        render json: {errors: [detail: "Credentials is wrong"]}, status: :unauthorized
      end
    end

    def auth_token
      token = super
      UserSerializer.new(entity, include: params.fetch(:include, '').split(','), params: { jwt: token }).serialized_json
    end

    def auth_params
      params.require(:data).require(:attributes).permit(:email, :password)
    end
  end
end
