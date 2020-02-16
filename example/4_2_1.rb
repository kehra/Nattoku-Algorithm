def quicksort(arr)
  if arr.size < 2
    arr
  else
    pivot = arr.first

    less = arr[1..-1].select do |x|
      x <= pivot
    end
    greater = arr[1..-1].select do |x|
      x > pivot
    end

    quicksort(less) + [pivot] + quicksort(greater)
  end
end

p quicksort([10, 5, 2, 3])