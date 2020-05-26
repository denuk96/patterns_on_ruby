class MovieIterator
  def initialize(movies_array)
    @movies_array = movies_array
    @index = 0
  end
​
  def position
    @movies_array[@index]
  end
  
  def next_moive
    @index += 1
    @movies_array[@index]
  end
​
  def movies_left_size
    @movies_array.size - (@index + 1)
  end
​
  def movies_left
    @movies_array.drop(@index + 1)
  end
end
​
movies = ['Green Mile', 'Shawshank Redemption', 'Forrest Gump', 'Schindlers List']
movies_iterator = MovieIterator.new(movies)
​
movies_iterator.position
# => "Green Mile"
​
2.times do movies_iterator.next_moive end
movies_iterator.position
# => "Forrest Gump"
movies_iterator.movies_left_size
# => 1
movies_iterator.movies_left
# => ["Schindlers List"]
