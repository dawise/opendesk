class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  # Relation modelling the ownership of projects
  has_many :projects, foreign_key: :owner_id

  # Relation modelling the memberships in project
  has_many :memberships, foreign_key: :member_id
end
