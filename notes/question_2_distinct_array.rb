=begin
Question #2:
 Create a Ruby class named "DistinctArray". A DistinctArray is very
 similar to an Array except for two differences:
  1) it does not contain duplicate elements
  2) it has a method named "to_multiset" which accepts one argument.
 The to_multiset method accepts an argument n. The return value
 should be an array of many distinct n-length arrays. Each n-length
 array should contain any number of copies of elements from the parent
 DistinctArray object.

 Example:
  distinct_array = DistinctArray.new
  3.times {|i| distinct_array.push(i) }
  distinct_array.to_multiset(2) # => [[0,0], [1,2], [1,1], [0,2], [0,1], [2,2]]
=end

# Perhaps inherit from Array to cover the bases. Or should we not make use of arrays?
class DistinctArray
  def initialize
    @set = []
  end

  def push element
    @set << element unless @set.include? element
  end

  def to_multiset r
    # Order is not important. Formulas:
    # n^r           Repition allowed
    # n! / (n - r)! Repition not allowed
    # -------------------------------------------------------
    # Instructions don't specify how many elements to return,
    # let's just return half of the maximum with 
    # -------------------------------------------------------
    maximum = (@set.count ** r) / 1

    # Each element in @set is gauranteed to be unique already
    multi_set = []

    until multi_set.count == maximum
      temporary_set = []
      r.times { temporary_set << @set.sort_by{ rand }.first }
      multi_set << temporary_set unless multi_set.include? temporary_set
    end

    return multi_set
  end

  # Doesn't allow repitition, but is considerably faser
  def to_multiset_simple n
    @set.permutation(n).to_a.sort_by { rand }
  end
end

distinct_array = DistinctArray.new
3.times {|i| distinct_array.push(i) }
r = distinct_array.to_multiset(2)
puts "#{r.count}: #{r.inspect}"
