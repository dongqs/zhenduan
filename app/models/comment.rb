class Comment < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :content, :email, :blog_id
end
