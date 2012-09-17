# coding: utf-8
class Accuracy
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  has_many :campaigns

  field :name, type: String
  field :design, type: String
end
