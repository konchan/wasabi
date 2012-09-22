# coding: utf-8
class Customer
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  belongs_to :user
  has_many :contacts , :dependent => :destroy
  has_many :campaigns, :dependent => :destroy
  
  scope :not_bti, excludes(name: "BTI")

  field :code, type: String
  field :name, type: String
  field :address, type: String
  field :url, type: String
  field :referral, type: String
  field :counter, type: Integer, default: 0
  field :description, type: String

  validates :name, presence: {message: "顧客名は必須です"}, 
    uniqueness: {message: "他の顧客名と重複しています"}
  validates :code, presence: {message: "3桁の顧客コードを入力してください"}, 
    uniqueness: {message: "顧客コードが重複しています。別なコードを入力してください"}, 
    length: {is: 3, message: "顧客コードが3桁未満、もしくは4桁以上になっています"}

  def self.search(word)
    if word.blank?
      not_bti
    else
      q = Regexp.new(word)
      results = where(name: q) + where(code: q)
      results.uniq
    end
  end
end
