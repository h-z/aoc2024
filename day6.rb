# frozen_string_literal: true

file = File.open('input6.txt')
xs = file.readlines.map(&:chomp)

def clone(m)
  m.map(&:dup)
end

def w(m)
  m.each_with_index do |l,i|
    j = l.index ?^
    return i, j if j
  end
end

def q(m, pos)
  return nil if pos.any? { !(0..m.size).include?(_1) }
  m.dig(pos.first)&.[](pos.last)
end

def find(m, obs = nil)
  pos = w(m)

  m[obs.first][obs.last] = '#' unless obs.nil?

  dir = -1, 0
  visited = Set.new

  while !q(m, pos).nil?
    m[pos.first][pos.last] = 'X'
    npos = pos.zip(dir).map(&:sum)
    vis = [npos.first, npos.last, dir.first, dir.last]

    return -1 if visited.include?(vis)

    visited << vis

    if q(m, npos) == '#'
      dir = [dir.last, -dir.first]
    else
      pos = npos
    end
  end
  m.map { _1.count('X') }.sum
end

xs2 = clone xs

pp find(xs)

puts xs
  .map
  .with_index { |l, i| l.chars.map.with_index { _1 == 'X' ? _2 : nil }.compact.map { [i, _1] } }
  .flatten(1)
  .select { find(clone(xs2), _1) == -1 }
  .count

