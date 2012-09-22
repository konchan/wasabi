# coding: utf-8
class Activity
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  belongs_to :campaign, autosave: true
  belongs_to :phase
  belongs_to :user
  belongs_to :action_kind
  has_many :tasks
#  has_and_belongs_to_many :tagged, inverse_of: :tagging, class_name: 'Tag'
  has_and_belongs_to_many :commented, inverse_of: :commenting, class_name: 'Comment'
#  has_and_belongs_to_many :linked, inverse_of: :linking, class_name: 'Linkage'

  field :name, type: String
  field :number, type: Integer
  field :date, type: Time
  field :detail, type: String
  
  scope :visit, lambda {
    ak_id = ActionKind.where(name: "訪問").first.id
    where(action_kind_id: ak_id)
  }
  scope :mail, lambda {
    ak_id = ActionKind.where(name: "メール").first.id
    where(action_kind_id: ak_id)
  }
  scope :DM, lambda {
    ak_id = ActionKind.where(name: "ダイレクトメール（DM）").first.id
    where(action_kind_id: ak_id)
  }
  scope :call, lambda {
    ak_id = ActionKind.where(name: "電話").first.id
    where(action_kind_id: ak_id)
  }
  scope :guest, lambda {
    ak_id = ActionKind.where(name: "来客").first.id
    where(action_kind_id: ak_id)
  }

  validates :name, presence: {message: "活動名は必須です"}
end
