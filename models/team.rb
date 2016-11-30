require_relative "./team_data"

class Team
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all
    teams = []
    TeamData::ROLL_CALL.each do |name, _roster|
      teams << Team.new(name)
    end
    return teams
  end
end
