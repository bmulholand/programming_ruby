# It looks like enumerator methods can be chained on a collection
# or another enumerator.

def example_1
  col = ["a", "b", "c", "d"]
  enu = col.each.each.map {|x| x + "a" }.each.each.with_index
  puts enu.next
end

def explicit_enumerator_example_1
  triangular_numbers = Enumerator.new do |y|
    number, count = 0, 1

    loop do
      number += count
      count += 1

      y.yield number
    end
  end

  # This is so elegant. Really cool to see how Ruby gets us away from normal loops.
  5.times { puts triangular_numbers.next }
end


# Really interesting, but watch for methods like count and select.
def infinite_enumerator_example
  triangular_numbers = Enumerator.produce([1, 2]) do |number, count|
    [number + count, count + 1]
  end

  p triangular_numbers.first(5).map { _1.first }
end



# This is neat, and so, so powerful. It makes me wonder
# how lazy actually works under the hood. I'm really in awe of how powerful this is!
class InfiniteStreamExample
  def all
    Enumerator.produce(0) { |n| n + 1 }.lazy
  end

  def self.run
    p new.all.select { (_1 % 3).zero? }.first(10)
  end
end

InfiniteStreamExample.run
