class Blog < ActiveRecord::Base
  STATUS = ['draft', 'limited', 'public']
  attr_accessible :content, :status, :title
  validates :content, presence: true
  validates :title, presence: true
  validates :status, presence: true, inclusion: STATUS

end
