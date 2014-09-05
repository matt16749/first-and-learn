class User < ActiveRecord::Base
  has_many :comments, :paths, :resources, :votes

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
