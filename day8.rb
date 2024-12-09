# frozen_string_literal: true

file = File.open('input8.txt')
xs = file.readlines.map(&:chomp)

pp xs
h = xs.size
as = Hash.new { |hash, key| hash[key] = Set.new }

xs.each_with_index do |l, i|
  l.chars.each_with_index do |c, j|
    as[c] << [i, j] if c != '.' && c != '#'
  end
end

def jumps(a, b, dx, dy, n = 1)
  (n == 1 ? 1 : 0).upto(n).map do |i|
    [[a[0] - (i * dx), a[1] - (i * dy)], [b[0] + (i * dx), b[1] + (i * dy)]]
  end.flatten(1)
end

def antinodes(as, h, j = 1)
  as.map do |_,v|
    v
      .sort
      .combination(2).map { jumps(_1, _2, (_2[0] - _1[0]), (_2[1] - _1[1]), j) }
      .flatten(1)
      .select { _1.all? { |a| (0..(h - 1)).include?(a) } }
  end.flatten(1).uniq
end

p antinodes(as, h).count
p antinodes(as, h, 50).count
