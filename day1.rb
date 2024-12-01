file = File.open('input1.txt')

xs = file.readlines.map(&:chomp).map { _1.split.map(&:to_i) }.transpose
p xs[0].sort.zip(xs[1].sort).map { (_1 - _2).abs }.sum
p xs[0].map { _1 * xs[1].count(_1) }.sum
