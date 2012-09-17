# coding: utf-8
class Kind
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  has_many :campaigns

  scope :not_all, excludes(name: "全て")

  field :name, type: String
  field :design, type: String
end
