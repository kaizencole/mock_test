class Laser < Weapon 

  attr_reader :name, :weight, :damage, :range

  def initialize
    @name = "Laser"
    @weight = 125
    @damage = 25
    @range = 1
  end

end
