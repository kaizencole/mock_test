class BoxOfBolts < Item

  DEFAULT_HEAL = 20

  def initialize
    @name = "Box of bolts"
    @weight = 25
  end

  def feed(robot_to_heal)
    robot_to_heal.heal(DEFAULT_HEAL)
  end

end
