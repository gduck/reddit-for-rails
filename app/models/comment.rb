class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :comment, :length => { maximum: 240 }, :presence => true
end
