

def sum(arr)
  sum = 0
  arr.each do | item |
     sum = sum + item
  end
  sum
end




def max_2_sum(arr)
  sum = 0
  sorted_array = arr.sort.reverse
  if sorted_array.length >= 2
  	sum = sorted_array[0] + sorted_array[1]
  elsif sorted_array.length == 1
  	sum = sorted_array[0]
  end
  sum
end




def sum_to_n?(arr, n)
  hash = {0=>true}
  i=0
  while i < arr.length
  	j = i+1
  	while j < arr.length
  	  sum = arr[i] + arr[j]
  	  hash[sum] = true
  	  j = j+1
  	end
  	i = i+1
  end
  return hash.key?(n)
end




