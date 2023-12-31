class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations

  validates :name, presence: true, length: { maximum: 25, too_long: '%<count>s characters is the maximum allowed' }
end
