class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone]

  has_many :programs
  belongs_to :city

  validates :phone, :presence => true, :numericality => true, :length => { :is => 10}, uniqueness: true
  validates :name, presence: true

  ## ------------------------------
  ## Temp password for new users
  ## ------------------------------

  def self.generate_password
    ('a'..'z').to_a.shuffle[0,8].join
  end

  ## ------------------------------
  ## Devise email removal
  ## ------------------------------

  def email_required?
   false
  end

  def will_save_change_to_email?
    false
  end
end
