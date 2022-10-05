module Enumerable
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for i in self
      yield i, index
      index += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    matching_values = []
    my_each { |value| matching_values << value if yield value }
    matching_values
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    result = true
    my_each { |value| result = false unless yield value}
    result    
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    result = false
    my_each { |value| result = true if yield value }
    result
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    result = true
    my_each { |value| result = false if yield value }
    result
  end

  def my_count(&block)
    return self.size unless block_given?
    my_select(&block).length
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    map_return = []
    my_each { |value| map_return.push yield value }
    map_return
  end

  def my_inject(initial_sum = 0)
    return to_enum(:my_inject) unless block_given?
    inject_results = initial_sum
    
    my_each { |value| inject_results = yield(inject_results, value) }
    inject_results
  end
end

class Array
  def my_each
    return to_enum(:my_each) unless block_given?
    for i in self
      yield i
    end
  end
end
