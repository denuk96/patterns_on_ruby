class Subscriber
  def notifier
    Proc.new { |post| p "#{post.title} updated" }
  end
end

class Post
  attr_accessor :title , :status, :subscribers

  def initialize(title, status)
    @title = title
    @status = status
    @subscribers = []
  end

  def status=(status)
    @status = status
    notify_subscribers
  end

  def notify_subscribers
    subscribers.each { |f| f.call self }
  end

  def subscribe(notifier)
    subscribers << notifier
  end

  def unsubscribe(subscriber)
    subscribers.select! { |s| s != subscriber }
  end
end

subscriber = Subscriber.new
post = Post.new('blbalba', 'new')
post.subscribe(subscriber.notifier)
post.status = 'moderating'
