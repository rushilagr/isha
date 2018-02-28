class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone]

  has_many :programs
  belongs_to :city, optional: true

  validates :phone, :presence => true, :numericality => true, :length => { :is => 10}

  def email_required?
   false
  end
end
