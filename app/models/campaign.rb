# coding: utf-8
class Campaign
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  belongs_to :customer, autosave: true
  belongs_to :contact
  belongs_to :user
  belongs_to :kind
  belongs_to :accuracy
  belongs_to :phase
  has_many   :activities, dependent: :destroy, autosave: true
#  has_many   :contracts, dependent: :destroy
  has_many   :tasks, dependent: :destroy
#  has_and_belongs_to_many :tagged, inverse_of: :tagging, class_name: 'Tag'
  has_and_belongs_to_many :commented, inverse_of: :commenting, class_name: 'Comment'

  field :name, type: String
  field :code, type: String
  field :status, type: String, default: :ongoing
  field :counter, type: Integer, default: 0
  field :started_at, type: Date
  field :recent_act_at, type: DateTime, default: Time.zone.now
  field :closed_at, type: Date
  field :period, type: Date
  field :amount, type: String, default: "0"
  field :term1, type: Date
  field :term2, type: Date
  field :description, type: String

  def status_with_inquiry
    status.try(:inquiry)
  end
  
  delegate :closed?, :pending?, :ongoing?, to: :status_with_inquiry, allow_nil: true
  
  scope :actives, where(status: :ongoing)
  scope :pendings, where(status: :pending)
  scope :closed, where(status: :closed) 
  scope :not_bti, excludes(code: "BTI000")
  scope :has_committed, lambda {
    a_id = Accuracy.where(name: "Commit").first.id
    closed.where(accuracy_id: a_id)
  }

  def status_name
    case status
    when /ongoing/ then "進行中"
    when /pending/ then "保留中"
    when /closed/  then "終了"
    end
  end

  def get_amount
    return "設定なし" if amount.nil?
    return amount
  end
    
  def get_period
    return "設定なし" if period.nil?
    return period.strftime('%Y-%m')
  end

  def self.search(word)
     if word.blank?
       not_bti
     else
       q = Regexp.new(word)
       c_id = Customer.where(name: q).first.id
       not_bti.where(name: q) + not_bti.where(code: q) + not_bti.where(customer_id: c_id)
     end
   end
end
