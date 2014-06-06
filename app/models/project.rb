class Project < ActiveRecord::Base
    belongs_to :owner, class: 'User'
    has_many :memberships
    has_many :members, through: :memberships
    has_many :posts

    validates :name, presence: true
end
