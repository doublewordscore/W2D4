def two_sum1?(array, target)
  # O(n^2)
  (0..array.length-1).each do |first|
    (first+1..array.length-1).each do |second|
      return true if array[first] + array[second] == target
    end
  end
  false
end

def two_sum2?(array, target)
  sorted = array.sort
  sorted.each_with_index do |el, idx|
    subtarget = target - el
    result = binary_search(array[idx+1..-1], subtarget)
    return true unless result == nil
  end
  false
end

def binary_search(array, target)
  return nil if array.empty?
  middle = array.length / 2
  left_side = array[0...middle]
  right_side = array[middle+1..-1]
  return middle if array[middle] == target
  case array[middle] <=> target
  when -1
    result = binary_search(right_side, target)
    result.nil? ? nil : result + middle + 1
  when 0
    return middle
  when 1
    return binary_search(left_side, target)
  end
end

def two_sum3?(array, target)
  # O(n)
  hash = Hash.new {|k,v| v = 0}
  array.each { |num| hash[num] += 1 }
  hash.keys.each do |el|
    if target / 2 == el
      return true if hash[el] == 2
    else
      return true if hash.has_key?(target - el)
    end
  end
  false
end

arr = [1, 4, 5, 5, 12]
p two_sum3?(arr, 12)
