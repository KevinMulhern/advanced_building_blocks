# Bubble sort method

def bubble_sort(array)
	# the counter represensents the last element in the array it is set as 1 initially
	counter = 1 
	# loop until there are no more swaps to make
	loop do
		i = 0
		# set swap variable as false, if this isn't changed to true after the iteration the loop will stop
		swap = false
		# take counter away from the end of the array as the last element's after each iteration will be the largest 
		while i < array.length - counter
			# if the current element is larger than the next element in the array.
			if array[i] > array[i+1]
				# swap the value of the next element with the current element's value and vice versa   
				array[i], array[i+1] = array[i+1],array[i]
				# a swap was made so swap is set to true
				swap = true 
			end
			i += 1
		end
		# increment the counter variable by 1 to make it 2 on the second iteration and 3 on the third etc
		counter += 1
		# break when the iteration goes through the array and doesn't swap anything
		break if swap == false
	end
	return array
end


# bubble sort_by method
# a block is inputted with an array of words, if the right word is smaller than the left
# then they will be swapped.

def bubble_sort_by(array)
	counter = 1
	loop do
		i = 0
		swap = false
		while i < array.length - counter
			if yield(array[i], array[i+1]) < 0
				array[i], array[i+1] = array[i+1],array[i]
				swap = true
			end
			i += 1
		end
		counter += 1
		break if swap == false
	end
	 print array
end



puts "-------------------------------"
puts "            Tests              "
puts "-------------------------------"

array = [4,3,78,2,0,2]
puts "First array to sort is: #{array.inspect}"
bubble_sort(array)
puts "First array after being sorted: #{array.inspect}"
puts

array2 = [6,90,26,56,8,62,82,18]
puts "The second array to sort is: #{array2.inspect}"
bubble_sort(array2)
puts "Second array after being sorted: #{array2.inspect}"
puts

array3 = (1..100).to_a.sample(10)
puts "The third array to sort is: #{array3.inspect}"
bubble_sort(array3)
puts "Third array after being sorted: #{array3.inspect}"
puts
puts

puts "Output from the bubble_sort by method: "

bubble_sort_by(["hi","hello","hey", 'howdy']) do |left,right| 
	right.length - left.length
end


