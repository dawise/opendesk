class Project < ActiveRecord::Base
    belongs_to :owner, class_name: 'User'
    has_many :memberships
    has_many :members, through: :memberships
    has_many :posts

    validates :name, presence: true
end
