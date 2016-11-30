require_relative "./team_data"

class Player

  attr_reader :name, :position, :team_name

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    players = []
    TeamData::ROLL_CALL.each do |team, roster|
      roster.each do |position, player|
        player << Player.new(player, position, team)
      end
    end
    player
  end

end
