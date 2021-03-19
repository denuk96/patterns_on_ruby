class Post
  attr_accessor :content

  def initialize(content)
    @content = content
    @state = NewState.new(self)
  end

  def publish
    @state.publish
  end

  def change_state(state)
    @state = state
  end

  def status
    @state.status
  end
end

class BasicState
  attr_accessor :content

  def initialize(content)
    @content = content
  end
end

class NewState < BasicState
  def publish
    @content.change_state(ModerateState.new(@content))
  end

  def status
    'new'
  end
end

class ModerateState < BasicState
  def publish
    @content.change_state(PublisheState.new(@content))
  end

  def status
    'moderating'
  end
end

class PublisheState < BasicState
  def publish
    self
  end

  def status
    'published'
  end
end

post = Post.new('blabla')
post.status
# => "new"
post.publish
post.status
# => "moderating"
post.publish
post.status
# => "published"
