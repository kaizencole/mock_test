require_relative 'item'

class Robot

  CAPACITY = 250
  DEFAULT_DAMAGE = 5

  attr_accessor :position, :health, :items, :equipped_weapon

  def initialize
    @position = [0,0]
    @health = 50
    @items = []
    @equipped_weapon = Laser.new
  end

  def move_left
    self.position[0] -= 1
  end

  def move_right
    self.position[0] += 1
  end

  def move_up
    self.position[1] += 1
  end

  def move_down
    self.position[1] -= 1
  end

#if self.items_weight <= 250, then execute line, else nil

  def pick_up(item)
    @items.push(item) unless items_weight + item.weight > CAPACITY
    @equipped_weapon = item if item.is_a?(Weapon)
  end

  def items_weight
    @items.inject(0) {|sum, item| sum + item.weight}
  end

  def wound(damage)
    if damage > @health
      self.health = 0
    else
      self.health -= damage
    end
  end

  def heal(heal)
    if @health + heal <= 100
      @health = @health + heal
    else
      @health = 100
    end
  end

  # def attack(enemy)
  #   enemy.wound(DEFAULT_DAMAGE)
  # end

  def bad_target
    raise Exception.new("Can only attack a robot.")
  end

  def attack(enemy)
    begin
      if enemy.is_a?(Robot)
        puts 'WAS A ROBOT'
        equipped_weapon.hit(enemy)
      else
        puts 'WAS NOT A ROBOT'
        bad_target
      end
    rescue Exception => e
      puts e.message
    end
  end

  def dead
    raise Exception.new("You're dead and can't be healed!")
  end

  def full_health
    raise Exception.new("You are already at full health.")
  end

  def heal!(heal)
    begin 
      if @health <= 0
        dead
        nil
      elsif @health + heal > 100
        full_health
        @health = 100
      else 
        @health = @health + heal
      end
    rescue Exception => e
      puts e.message
    end
  end
end