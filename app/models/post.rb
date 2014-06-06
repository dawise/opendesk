class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :path => ':class/:attachment/:id/:style/:filename'

   validates_attachment_content_type :image, :content_type => /\Aimage/



end



