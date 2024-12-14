# frozen_string_literal: true

file = File.open('input9.txt')
xs = file.readlines.map(&:chomp).first

dm = xs.chars.map.with_index do |c, i|
  Array.new(c.to_i, i.odd? ? nil : (i / 2))
end

def c1(m)
  x = m.pop
  idx = m.index(nil)
  return if idx.nil?
  m[idx] = x
end

dm1 = dm.flatten
while dm1.count(nil).positive?
  c1(dm1)
end

pp dm1.map.with_index { _1 * _2 }.sum

rdm = dm.reverse

rdm.each_with_index do |rx, ri|
  next if rx.first.nil?

  pidx = dm.index { |x| x.first.nil? && x.size >= rx.size}
  next if pidx.nil?

  idx = dm.index(rx)
  next if pidx > idx
  e = dm[pidx]
  size = e.size
  dm[dm.index(rx)] = [nil] * rx.size
  dm[pidx] = rx
  dm.insert(pidx+1, [nil] * (size - rx.size))
end

pp dm.flatten.map.with_index { (_1 || 0)  * _2 }.sum
