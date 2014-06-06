class Membership < ActiveRecord::Base
  belongs_to :member, class: 'User'
  belongs_to :project
end
