class Stack
    def initialize
      @stack = []
    end

    def add(el)
      @stack.push(el)
    end

    def remove
      @stack.pop
    end

    def show
      self
    end
  end

p "tests stack"

stack = Stack.new

s1 = "first"
s2 = "second"
s3 = "third"

stack.add(s1)
stack.add(s2)
stack.add(s3)
p stack.remove
p stack.remove
p stack.remove


class Queue
  def initialize
    @queue = []
  end

  def add(el)
    @queue.push(el)
  end

  def remove
    @queue.shift
  end

  def show
    self
  end
end

p "test queue"

queue = Queue.new
s1 = "first"
s2 = "second"
s3 = "third"

queue.add(s1)
queue.add(s2)
queue.add(s3)
p queue.remove
p queue.remove
p queue.remove
