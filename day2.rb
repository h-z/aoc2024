# frozen_string_literal: true

file = File.open('input2.txt')
xs = file.readlines.map(&:chomp).map { _1.split.map(&:to_i) }

def good?(row)
  ys = row.each_cons(2).map { _1 - _2 }
  ys.all? { !_1.zero? && _1.abs < 4 } && (ys.all?(&:positive?) || ys.none?(&:positive?))
end

def m1(row)
  row.size.times.map { |i| row.dup.tap { |a| a.delete_at(i) } }
end

p xs.map { good? _1 }.count(true)

p xs.map { good?(_1) || m1(_1).any? { |r| good?(r) } }.count(true)

