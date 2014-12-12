class Post < ActiveRecord::Base
# validates :column_name, 

  # regex = regular expression
  URL_REGEX = /https?:\/\/[\S]+/

  validates :title, :length => { maximum: 3 }, :presence => true
  validates :url, :length => { maximum: 3 }, :allow_blank => true, :format => { with: URL_REGEX }

  validate :spam_free

  validate :post_count

  private

  def post_count
    count = Post.count
    if count > 20
      self.errors.add(:base, "Cannot posts more than 20 posts")
      self.errors.add(:base, "cat")
    end
  end

  def spam_free
    # order all the posts reverse chronologically
    # the latest post
    # get the posted time for the latest post
    last_post = Post.order(:created_at).last
    latest_time = last_post.created_at

    # goal: the user can only post after 1 minute
    if latest_time > 1.minute.ago
      # if this is true, the last post was made in less 1 minute ago, so please raise an error
      self.errors.add(:base, "Cannot post within 1 minute")
    end
  end
end
