
class RandomSquence
  def initialize(limit, num)
    @limit = limit
    @num = num
  end

  def each
    @num.times { yield (rand * @limit).floor }
  end
end

i = -1
RandomSquence.new(10,4).each do |n|
  i = n if i<n
end

