class AVLTreeNode
  attr_accessor :link, :balance, :value, :nodes

  def initialize(value)
    @value = value
    @balance = 0
    # @link = link
    @nodes = [nil, nil]
  end
end

class AVLTree

  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = AVLTreeNode.new(value)
    else

    end
  end

  def insert_unbounded(value)

  end

  def remove(value)

  end

  def remove_unbounded(value)

  end

  def height

  end

  def self.insert!(node, value, done)

  end

  def self.single_rotation!(root, dir)

  end

  def self.double_rotation!(root, dir)

  end

  def self.adjust_balance!(root, dir, bal)

  end

  def self.insert_balance!(root, dir)

  end

  def self.remove_balance!(root, dir, done)

  end

  def self.remove!(root, value, done)

  end

  def self.height!(root)

  end

  def self.single_rotation_unbounded!(root, dir)

   end

   def self.double_rotation_unbounded!(root, dir)

   end

   def self.insert_unbounded!(root, value, done)

   end

   def self.remove_unbounded!(root, value, done)

   end
end
