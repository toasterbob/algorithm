class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root, value)
    end
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) if node.nil?

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end



  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value <= node.value
      BinarySearchTree.find!(node.left, value)
    else
      BinarySearchTree.find!(node.right, value)
    end


  end

  def self.preorder!(node)
    return [] unless node
    result_arr = [node.value]
    result_arr += BinarySearchTree.preorder!(node.left) if node.left
    result_arr += BinarySearchTree.preorder!(node.right) if node.right

    result_arr
  end

  def self.inorder!(node)
    return [] unless node
    result_arr = []
    result_arr += BinarySearchTree.inorder!(node.left) if node.left
    result_arr << node.value
    result_arr += BinarySearchTree.inorder!(node.right) if node.right

    result_arr
  end

  def self.postorder!(node)
    return [] unless node
    result_arr = []
    result_arr += BinarySearchTree.postorder!(node.left) if node.left
    result_arr += BinarySearchTree.postorder!(node.right) if node.right
    result_arr << node.value

    result_arr
  end

  def self.height!(node)
    return -1 unless node
    1 + [BinarySearchTree.height!(node.left), BinarySearchTree.height!(node.right)].max
  end

  def self.max(node)
    return nil if node.nil?
    if node.right
      BinarySearchTree.max(node.right)
    else
      node
    end
  end

  def self.min(node)
    return nil if node.nil?
    if node.left
      BinarySearchTree.min(node.left)
    else
      node
    end
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left
    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      new_node = node
      node = new_node.right.min
      node.right = BinarySearchTree.delete_min!(new_node.right)
      node.left = new_node.left
    end

    node
  end
end
