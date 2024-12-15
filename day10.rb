# frozen_string_literal: true

file = File.open('input10.txt')
xs = file.readlines.map(&:chomp).map { _1.chars.map(&:to_i) }

class D10
  def initialize(m)
    @map = m
    @starts = w(0)
    # @sum = 0
    @sum = Hash.new { |hash, key| hash[key] = Array.new }
  end

  def w(v)
    r = []
    @map.each_with_index do |l, i|
      l.each_with_index do |c, j|
        r << [i, j] if c == v
      end
    end
    r
  end

  def n(x, y, start)
    v = @map[x][y]

    if v == 9
      @sum[start.join(',')] << [x, y]
    else
      [
        ns(x + 1, y, v + 1),
        ns(x, y + 1, v + 1),
        ns(x - 1, y, v + 1),
        ns(x, y - 1, v + 1)
      ].compact.each do |nx, ny|
        n(nx, ny, start)
      end
    end
  end

  def ns(x, y, v)
    return if x < 0
    return if y < 0
    return if @map[x].nil? || @map[x][y].nil?
    return if @map[x][y] != v

    [x, y]
  end

  def solve
    @starts.each do |x, y|
      n(x, y, [x, y])
    end
    p @sum.values.map { _1.to_set.size }.sum
    p @sum.values.map(&:size).sum
  end
end

D10.new(xs).solve
