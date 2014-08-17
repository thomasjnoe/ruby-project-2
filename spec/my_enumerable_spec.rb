require 'spec_helper'

describe "Enumerable Module" do

	describe "#my_select" do
		context "with empty array" do
			it "returns an empty array" do
				array = [].my_select { |x| x == 1 }
				expect(array).to eql []
			end
		end

		context "with an array of integers" do
			let (:array) { [1,-2,3,4,5,-6] }

			it "returns even numbers only" do
				expect(array.my_select { |x| x.even? } ).to eql [-2,4,-6]
			end

			it "returns odd numbers only" do
				expect(array.my_select { |x| x.odd?} ).to eql [1,3,5]
			end

			it "returns multiples of 3" do
				expect(array.my_select { |x| x % 3 == 0 } ).to eql [3,-6]
			end

			it "returns non-negative integers" do
				expect(array.my_select { |x| x > 0} ).to eql [1,3,4,5]
			end
		end

		context "with an array of strings" do
			let (:array) { ["lol","hello","goodbye","lonely hearts club band","hey"] }

			it "returns array of strings containing 'lo' " do
				expect(array.my_select { |x| x.include? "lo" } ).to eql ["lol", "hello", "lonely hearts club band"]
			end

			it "returns array of strings of length 3" do
				expect(array.my_select { |x| x.length == 3 } ).to eql ["lol", "hey"]
			end
		end

		context "with a mixed array" do
			let (:array) { ["lol","hello",4,100,{ :word => "bird", :number => 8 },"hey"] }

			it "returns all strings" do
				expect(array.my_select { |x| x.class == String } ).to eql ["lol", "hello", "hey"]
			end

			it "returns all fixnums" do
				expect(array.my_select { |x| x.class == Fixnum } ).to eql [4, 100]
			end

			it "returns all hashes" do
				expect(array.my_select { |x| x.class == Hash } ).to eql [{ :word => "bird", :number => 8 }]
			end
		end

		context "with a string" do
			it "raises NoMethodError" do
				string = "Hello World!"
				expect { string.my_select { |x| x == "!" } }.to raise_exception NoMethodError
			end
		end

		context "with an integer" do
			it "raises NoMethodError" do
				int = 5
				expect { int.my_select { |x| x == 5 } }.to raise_exception NoMethodError
			end
		end
	end

end