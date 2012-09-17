# coding: utf-8
class Contact
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  belongs_to :customer
  belongs_to :user
  has_many :campaigns

  field :name, type: String
  field :title, type: String
  field :affiliation, type: String
  field :email, type: String
  field :phone, type: String
  field :description, type: String
end
