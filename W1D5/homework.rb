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
      @stack.dup
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
    @queue.dup
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


class Map

  def initialize
    @map = Array.new
  end

  def assign(key,val)
    if @map.none? {|kv_pair| kv_pair.first == key}
      @map.push([key,val])
    else
      @map.each_with_index {|kv_pair,idx| kv_pair[1] = val if kv_pair.first == key}
    end
  end

  def lookup(key)
    return_val = @map.select {|kv_pair| kv_pair.first == key}.last
  end

  def remove(key)
    @map.reject! {|kv_pair| kv_pair.first == key}
  end

  def show
    deep_dup(@map)
  end

  def deep_dup(arr)
   arr.map { |kv_pair| kv_pair.is_a?(Array) ? deep_dup(kv_pair) : kv_pair }
  end
end

p "test map"

map = Map.new

s1 = "first"
s2 = "second"
s3 = "third"
# filling up
map.assign(s1,1)
map.assign(s2,2)
map.assign(s3,3)
p map.lookup(s3)
p "trying to assign second key should overwrite value"
map.assign(s3,100)
p map.lookup(s3)
p "trying to delete value by key"
map.remove(s3)
p map.lookup(s3)
p "regular lookup"
p map.lookup(s2)
