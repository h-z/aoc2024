# frozen_string_literal: true

file = File.open('input3.txt')
xs = file.readlines.map(&:chomp)
MUL = /mul\((\d+),(\d+)\)/

y = xs.map do |x|
  x.scan(MUL).map { _1.to_i * _2.to_i }.sum
end
p y.sum

enabled = true
y = xs.map do |x|
  ys = x.split(/(do\(\)|don't\(\))/)
  s = 0
  ys.each do |l|
    if l == 'do()'
      enabled = true
    elsif l == "don't()"
      enabled = false
    elsif enabled
      s += l.scan(MUL).map { _1.to_i * _2.to_i }.sum
    end
  end
  s
end
p y.sum
