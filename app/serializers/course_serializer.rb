class CourseSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :category
  attributes :name, :author
end
