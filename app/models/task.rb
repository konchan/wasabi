# coding: utf-8
class Task
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  belongs_to :activity
  belongs_to :campaign
  belongs_to :user
  belongs_to :priority
#  has_and_belongs_to_many :tagged, inverse_of: :tagging, class_name: 'Tag'
  has_and_belongs_to_many :commented, inverse_of: :commenting, class_name: 'Comment'
#  has_and_belongs_to_many :linked, inverse_of: :linking, class_name: 'Linkage'

  delegate :campaign_code, to: :campaign, allow_nil: true

  validates :name, presence: {message: "タスク名の入力は必須です"}

  field :name, type: String
  field :detail, type: String
  field :deadline, type: DateTime
  field :started_at, type: Date
  field :closed_at, type: Date
  
  scope :finished, excludes(closed_at: nil)
  scope :unclosed, where(closed_at: nil)
  
  def campaign_code
    return "共通" if campaign.code =~ /BTI/
    return campaign.code
  end

  validates :name, presence: {message: "タスク名は必須です"}
end
