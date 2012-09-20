# coding: utf-8
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  belongs_to :user
  has_and_belongs_to_many :commenting, inverse_of: :commented, class_name: 'Campaign'
  has_and_belongs_to_many :commenting, inverse_of: :commented, class_name: 'Activity'
#  has_and_belongs_to_many :commenting, inverse_of: :commented, class_name: 'Action'
  has_and_belongs_to_many :commenting, inverse_of: :commented, class_name: 'Task'

  field :title, type: String
  field :description, type: String

  validates :title, presence: {message: "コメントタイトルは必須です"}
  validates :description, presence: {message: "コメントの内容は必須です"}
end
