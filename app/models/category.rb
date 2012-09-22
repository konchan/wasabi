class Category
  include Mongoid::Document
  field :cid, type: String
  field :name, type: String
  field :design, type: String
end
