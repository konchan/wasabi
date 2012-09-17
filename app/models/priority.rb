# coding: utf-8
class Priority
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  has_many :tasks

  field :name, type: String
  field :design, type: String
end
