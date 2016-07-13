Node = Struct.new(:data, :next)

class LinkedList
  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  def add_first_node(data)
    @head = Node.new(data, nil)
    @last = @head
  end

  def add_node(data)
    if @head.nil?
      add_first_node(data)
    else
      new_node = Node.new(data, nil)
      @last.next = new_node
      @last = new_node
    end
  end

  def search(index)
    current_node = @head
    index.times do
      return nil if current_node.next.nil?
      current_node = current_node.next
    end
    current_node
  end

  def value(index)
    node = search(index)
    return nil if node.nil?
    node.data
  end

  def insert_node(data, index)
    prior_node = search(index-1)
    new_node = Node.new(data, prior_node.next)
    prior_node.next = new_node
  end

  def reverse
    current_node = @head
    next_node = @head.next
    @head.next = nil
    prior_node = nil
    until next_node.nil?
      prior_node = current_node
      current_node = next_node
      next_node = current_node.next
      current_node.next = prior_node
    end
  end

end

list = LinkedList.new
