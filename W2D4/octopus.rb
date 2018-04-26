

def sluggish(arr)
  longest_fish = arr.first
  arr.each_with_index do |el,i|
    arr.each_with_index do |el2,j|
      unless i == j
        longest_fish = el2 if el2.length > longest_fish.length
      end
    end
  end
  longest_fish
end

def dominant(arr)
print  merge_sort(arr)
end

def b_search(arr,target)
  return nil if arr.length == 0
  pivot_index = arr.length / 2
  if arr[pivot_index] == target
    return arr[pivot_index]
  elsif arr[pivot_index] < target # right side
    return b_search(arr[pivot_index + 1 .. -1], target)
  else # left side
    return b_search(arr[0...pivot_index], target)
  end
end


def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = arr.take(mid)
  right = arr.drop(mid)
  merge(merge_sort(left),merge_sort(right))
end

def merge(left,right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first <= right.first
    [left.first] + merge(left[1..-1], right)
  else
    [right.first] + merge(left, right[1..-1])
  end
end




p sluggish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

p dominant(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
