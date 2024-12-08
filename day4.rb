# frozen_string_literal: true

RE = /(?=XMAS)|(?=SAMX)/
file = File.open('input4.txt')
xs = file.readlines.map(&:chomp)

def t(m)
  m.map(&:chars).transpose.map(&:join)
end

def skew(m, dir = 0)
  l = m.first.size

  m.map.with_index do
    a=?. * _2
    b=?. * (l - _2)
    "#{dir.zero? ? a : b}#{_1}#{dir.zero? ? b : a}"
  end
end

def count(m)
  m.map { _1.scan(RE).count }.sum
end

p count(xs) + count(t(xs)) + count(t(skew(xs))) + count(t(skew(xs, 1)))

max = xs.size - 1
s = 0
xs.each_with_index do |l, i|
  l.chars.each_with_index do |c, j|
    if i > 0 && j > 0 && j < max && i < max && c == 'A'
      b = xs[i-1][j-1..j+1] + xs[i][j-1..j+1] +xs[i+1][j-1..j+1]
      s += 1 if [/M.M...S.S/, /S.S...M.M/, /S.M...S.M/, /M.S...M.S/].any? { b =~ _1 }
    end
  end
end
p s
