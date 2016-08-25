def windowed_max_range(array, window)
  result = 0
  x = 0
  y = window

  while y < array.length + 1
    subarray = array[x...y]
    if (subarray.max - subarray.min) > result
      result = subarray.max - subarray.min
    end
    x += 1
    y += 1
  end
  result
end




p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
