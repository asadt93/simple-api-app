class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email
  attribute :jwt do |_, params|
    params[:jwt]
  end
end
