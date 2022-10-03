class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :contacts, dependent: :destroy
  has_many :parks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
end