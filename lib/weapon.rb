class Weapon < Item

  attr_reader :name, :weight, :damage, :range

  def initialize(name, weight, damage, range)
    @name = "power_shock"
    @weight = 10
    @damage = 45
    @range = range
  end

  def hit(robot)
    robot.wound(self.damage)
  end 

end