class Comment < ActiveRecord::Base

  validates :comment, :length => { maximum: 140 }, :presence => true

  belongs_to :user
  belongs_to :post
end
