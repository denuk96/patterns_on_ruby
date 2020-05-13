# Real
class Comment
  attr_reader :content

  def initialize(content)
    @content = content
  end
  
  def content
    @content
  end
end

# Proxy
class FiltredCommment
  attr_reader :comment

  def initialize(comment)
    @comment = comment
  end
  
  def spam?
    # check on spam
    rand(2) == 1
  end

  def content
    @comment.content
  end   
end

comment = FiltredCommment.new(Comment.new('blabla'))
comment.spam?
comment.content
