def find_smallet(arr)
  smallest = arr.first
  smallet_index = 0

  arr[1..-1].each.with_index(1) do |value, i|
    if value < smallest
      smallest = value
      smallet_index = i
    end
  end

  smallet_index
end

def selection_sort(arr)
  work = arr.dup
  result = []

  arr.size.times do
    smallet_index = find_smallet(work)
    result << work.slice!(smallet_index)
  end

  result
end

p selection_sort([5, 3, 6, 2, 10])