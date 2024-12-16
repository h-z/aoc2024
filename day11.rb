# frozen_string_literal: true

file = File.open('input11.txt')

xs = file.readlines.map(&:chomp).first.split.map(&:to_i)


def blink(nums)
  result = Hash.new { |hash, key| hash[key] = 0 }
  nums.each do |k, v|
    if k == 0
      result[1] += v
    elsif k.digits.size.even?
      result[k.digits.reverse[0..k.digits.size/2-1].join.to_i] += v
      result[k.digits.reverse[k.digits.size/2..-1].join.to_i] += v
    else
      result[k * 2024] = v
    end
  end
  result
end

nums = xs.map { [_1, 1] }.to_h
25.times { nums = blink(nums) }
pp nums.values.sum

nums = xs.map { [_1, 1] }.to_h
75.times { nums = blink(nums) }
pp nums.values.sum
