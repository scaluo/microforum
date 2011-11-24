class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :replies,:dependent=>:destroy
  validates_presence_of :title
  validates_presence_of :content
  self.per_page = 20
end
