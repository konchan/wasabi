# codign: utf-8
class ActionKind
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
#  has_many :actions

  field :name, type: String
  field :design, type: String
end
