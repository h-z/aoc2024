# frozen_string_literal: true

file = File.open('input5.txt')
xs = file.readlines.map(&:chomp)
pors = []
us = []
xs.each do |l|
  if l.index(?|)
    pors << l.split(?|).map(&:to_i)
  elsif l.index(?,)
    us << l.split(?,).map(&:to_i)
  end
end

ys = us.select do |u|
  u.map.with_index do |page, i|
    (u[0..i] & pors.select { _1.first == page }.map(&:last)).empty?
  end.all?
end

pp ys.map { _1[_1.size/2 ] }.sum

zs = us.reject { ys.include? _1 }

ws = zs.map do |z|
  l = z.size - 1
  found = true
  while found
    ok = true
    l.times do |i|
      if pors.include?([z[i + 1], z[i]])
        z[i], z[i + 1] = z[i + 1], z[i]
        ok = false
      end
    end
    found = false if ok
  end
  z
end

pp ws.map { _1[_1.size/2 ]}.sum
