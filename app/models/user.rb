class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :rememberable, :trackable, :database_authenticatable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :role, :name, :email, :password
  ROLES=%w[admin author]

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      name = ""
      if data["name"] =~ /^[\w]+\s[\w]+$/
        name = "#{data['first_name']} #{data['last_name']}"
      else
        name = "#{data['last_name']} #{data['first_name']}"
      end
      
      User.create!(name: name,
                   email: data["email"], 
                   password: Devise.friendly_token[0,20])
    end
  end

#  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
#    data = access_token.info
#    user = User.where(:email => data["email"]).first
#    
#    unless user
#      user = User.create(name: data["name"],
#                         email: data["email"],
#                         password: Devise.friendly_token[0,20])
#    end
#    user
#  end
end
