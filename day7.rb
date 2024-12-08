# frozen_string_literal: true

file = File.open('input7.txt')
xs = file.readlines.map(&:chomp)

def find(m, opss)
  m.map do |x|
    test, is = x.split ?:
    test = test.to_i
    os = opss.repeated_permutation(is.count(' ') - 1)

    ok = os.any? do |ops|
      ys = is.split.zip(ops).flatten
      y = ys.shift
      test == ys.each_slice(2).map(&:join).reduce(y) { |memo, w| memo = eval("#{memo}#{w}")}
    end

    ok ? test : 0
  end.sum
end

p find(xs, [:+, :*])
p find(xs, [:+, :*, ''])
