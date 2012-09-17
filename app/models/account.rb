# coding: utf-8
class Account
  include Mongoid::Document
  field :name, type: String
  field :identifier_url, type: String
  field :email, type: String
  field :role, type: String
  field :uid, type: String
end
