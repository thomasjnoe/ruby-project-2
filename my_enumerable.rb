#!/usr/bin/env ruby

module Enumerable

	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i += 1
		end
	end

	def my_select
		selected = []
		self.my_each { |i| selected.push(i) if yield(i) }
		selected
	end

	def my_all?
		self.my_select { |i| yield(i) } == self ? true : false
	end

	def my_any?
		self.my_select { |i| yield(i) }.size > 0 ? true : false
	end

	def my_none?
		!my_any? { |i| yield(i) }
	end

	def my_count(arg = nil)
		arg ? self.my_select { |i| i == arg }.size : self.my_select { |i| yield(i) }.size
	end

	def my_map(&my_proc)
		array = []
		self.my_each { |i| array.push(my_proc.call(i)) }
		array
	end

	def my_inject(memo = nil)
		if memo.nil?
			memo = self[0]
			i = 1
		else
			i = 0
		end
		while i < self.size
			memo = yield(memo, self[i])
			i += 1
		end
		memo
	end

end

def multiply_els(arr)
	arr.my_inject { |product, num| product * num }
end

