class Knight
  attr_accessor :pos, :ne, :en, :es, :se, :sw, :ws, :wn, :nw
  def initialize(pos)
    @pos = pos
    @ne = [1, 2]
    @en = [2, 1]
    @es = [2, -1]
    @se = [1, -2]
    @sw = [-1, -2]
    @ws = [-2, -1]
    @wn = [-2, 1]
    @nw = [-1, 2]
  end
end

class Board
  def initialize(start_x, start_y)
    @knight = Knight.new([start_x, start_y])
  end

  def position
    puts "\nYour knight is:"
    puts "\tAcross: #{@knight.pos[0]}\n\tHigh: #{@knight.pos[1]}\n\n"
  end

  def move(direction, pos = @knight.pos)
    temp = nil
    case direction
    when 'ne'
      temp = [pos[0] + @knight.ne[0], pos[1] + @knight.ne[1]]
    when 'en'
      temp = [pos[0] + @knight.en[0], pos[1] + @knight.en[1]]
    when 'es'
      temp = [pos[0] + @knight.es[0], pos[1] + @knight.es[1]]
    when 'se'
      temp = [pos[0] + @knight.se[0], pos[1] + @knight.se[1]]
    when 'sw'
      temp = [pos[0] + @knight.sw[0], pos[1] + @knight.sw[1]]
    when 'ws'
      temp = [pos[0] + @knight.ws[0], pos[1] + @knight.ws[1]]
    when 'wn'
      temp = [pos[0] + @knight.wn[0], pos[1] + @knight.wn[1]]
    when 'nw'
      temp = [pos[0] + @knight.nw[0], pos[1] + @knight.nw[1]]
    end
    if temp.min.negative? || temp.max > 7
      return nil
    else
      return temp
    end
  end

  def adj()
  end

  i=0
  def knights_moves(get_to, spot = @knight.pos, queue = [], pred = [], ron= [])
    i+=1
    if spot == get_to
      p pred
      p round
    else
      pred.push(spot)
      ne = move('ne', spot)
      en = move('en', spot)
      es = move('es', spot)
      se = move('se', spot)
      sw = move('sw', spot)
      ws = move('ws', spot)
      wn = move('wn', spot)
      nw = move('nw', spot)
      queue.push(ne) && ron.push(i) unless ne.nil?
      queue.push(en) && ron.push(i) unless en.nil?
      queue.push(es) && ron.push(i) unless es.nil?
      queue.push(se) && ron.push(i) unless se.nil?
      queue.push(sw) && ron.push(i) unless sw.nil?
      queue.push(ws) && ron.push(i) unless ws.nil?
      queue.push(wn) && ron.push(i) unless wn.nil?
      queue.push(nw) && ron.push(i) unless nw.nil?
      knights_moves(get_to, queue.shift, queue, pred, ron) unless queue.empty?
    end
  end

  def height(get_to, start = @knight.pos)
    if get_to == start
      -1
    else
      ne_height = height(ne) unless node.left.nil?
      right_height = height(node.right.value) unless node.right.nil?
    end
    left_height = -1 if left_height.nil?
    right_height = -1 if right_height.nil?
    [left_height, right_height].max + 1
  end

end

alex = Board.new(0,0)
alex.move('ne')
alex.move('ne', [0,0])
alex.knights_moves([3,3])