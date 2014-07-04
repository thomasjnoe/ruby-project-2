#!/usr/bin/ruby

#Check if array is sorted in ascending order
def sorted?(arr)
	arr.each_cons(2).all? { |x, y| (x <=> y) <= 0 }
end

#Check if array is sorted in ascending order by length
def sorted_by_length?(arr)
	arr.each_cons(2).all? { |x, y| (x.length <=> y.length) <= 0 }
end

#Non-destructive sorting method used to sort an array in ascending order using the bubble sort algorithm
def bubble_sort(arr)
	sorted_arr = arr.clone
	len = sorted_arr.length-1
	until sorted?(sorted_arr) do
		sorted_arr[0..len].each.with_index do |item, index|
			if sorted_arr[index + 1].nil? == false && sorted_arr[index] > sorted_arr[index + 1]
				sorted_arr[index], sorted_arr[index + 1] = sorted_arr[index + 1], sorted_arr[index]
			end
		end
		len -= 1
	end
	return sorted_arr
end

#Non-destructive sorting method used to sort an array in ascending order by word length using the bubble sort algorithm
def bubble_sort_by(arr)
	sorted_arr = arr.clone
	len = sorted_arr.length-1
	until sorted_by_length?(sorted_arr)
		sorted_arr[0..len].each_with_index do |item, index|
			if sorted_arr[index + 1].nil? == false && yield(sorted_arr[index], sorted_arr[index - 1]) < 0
				sorted_arr[index], sorted_arr[index + 1] = sorted_arr[index + 1], sorted_arr[index]
			end
		end
		len -= 1
	end
	return sorted_arr
end

p bubble_sort([4,3,78,2,0,2])

p bubble_sort_by(["hi", "hello", "hey"]) { |left, right| right.length - left.length }
