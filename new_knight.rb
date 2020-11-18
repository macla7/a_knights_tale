# Make proper grid, and self.allowed?(move)
class Chessboard
  @@board = []
  def initialize
    @@board = Array.new
    for i in 1..8
      for j in 1..8
        @@board.push([i,j])
      end
    end
  end

  def self.allowed?(move)
    return true if @@board.include? move
    false
  end
end

# def a pos
# moves, incoporating possible moves using Chessboard.allowed?
# knight_moves using path_to from Path
class Knight
  def initialize(pos = [0,0])
    @pos = pos
  end

  def possible_moves(pos = @pos)
    potential_shifts = [[1, 2],[2, 1],[2, -1],[1, -2],[-1, -2],[-2, -1],[-2, 1],[-1, 2]]
    potential_pos = []
    potential_shifts.each do |shift|
      potential_pos.push([pos[0] + shift[0], pos[1] + shift[1]])
    end
    potential_pos
    moves = []
    potential_pos.each do |pos|
      moves.push(pos) if Chessboard.allowed? pos
    end
    moves
  end

  def knight_moves
  end
end

# Nodes for the path
# pos & parent node
class Node
  attr_reader :pos, :parent
  def initialize(pos, parent = nil)
    @pos = pos
    @parent = parent
  end
end

# root
# path_to(start_pos, end_pos, chesspiece)
class Path
end

game = Chessboard.new
alex = Knight.new()
p alex.possible_moves