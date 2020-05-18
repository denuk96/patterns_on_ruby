class Feed
  # assume its belongs_to user
  def update(post)
    p "#{post.title} has been updated to #{post.status}"
  end
end

class Post
  attr_reader :title , :status

  def initialize(title, status)
    @title = title
    @status = status
    @feeds = []
  end

  def status=(status)
    @status = status
    notify_feeds
  end

  def notify_feeds
    @feeds.each { |f| f.update(self) }
  end

  def add_feed(feed)
    @feeds << feed
  end

  def status
    @status
  end

  def title
    @title
  end  
end

feed = Feed.new
post = Post.new('blbalba', 'new', feed)
post.status=('moderated')
