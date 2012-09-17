class Category
  include Mongoid::Document
  field :name, type: String
  field :design, type: String
end
