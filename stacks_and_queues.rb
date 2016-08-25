class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    el = @store.shift
    el
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end
end



class MyStack

  attr_reader :max_values

  def initialize
    @store = []
    @max_values = []
    @min_values = []
  end

  def pop
    el = @store.delete_at(-1)
    @max_values.pop
    @min_values.pop
    el
  end

  def push(el)
    @store << el
    max(el)
    min(el)
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end

  def max(el)
    if @max_values.empty?
      @max_values << el
      return true
    end
    if el > @max_values.last
      @max_values << el
    else
      @max_values << @max_values[-1]
    end
    @max_values[-1]
  end

  def min(el)
    if @min_values.empty?
      @min_values << el
      return true
    end
    if el < @max_values.last
      @max_values << el
    else
      @max_values << @max_values[-1]
    end
    @min_values[-1]
  end

end



class StackQueue < MyStack
  attr_reader :input, :output

  def initialize
    @input = MyStack.new
    @output = MyStack.new
  end

  def enqueue(el)
    until @output.empty?
      @input.push(@output.pop)
    end
    @input.push(el)
  end

  def dequeue
    until @input.empty?
      @output.push(@input.pop)
    end
    @output.pop
  end

  def size
    [@input.size, @output.size].max
  end

  def empty?
    @input.empty? && @output.empty?
  end

  def max
    [@input.max, @output.max].max
  end

  def min
    [@input.min, @output.min].min
  end

end
