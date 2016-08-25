require 'byebug'

def my_min1(array)
  el = array[-1]
  array.each do |num1|
    array.each do |num2|
      el = num2 if num2 < el
    end
  end
  el
end

def my_min2(array)
  result = array[-1]
  array.each {|el| result = el if el < result}
  result
end

def sub_sums1(array)
  subarrays = []
  (0..array.length - 1).each do |idx1|
    (idx1+1...array.length).each do |idx2|
      subarrays << array[idx1..idx2]
    end
  end
  subarrays.map! {|el| el.inject(:+)}
  subarrays.sort.last
end

def sub_sums2(array)
  current_total = array.first
  final = array.first

  array[1..-1].each do |num|

    current_total = 0 if current_total < 0
    current_total += num
    final = current_total if current_total > final

  end
  final
end
