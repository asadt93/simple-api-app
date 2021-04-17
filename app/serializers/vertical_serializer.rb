class VerticalSerializer
  include FastJsonapi::ObjectSerializer
  set_type :vertical
  attributes :name
end
