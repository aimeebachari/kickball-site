require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
   @teams = Team.all
   erb :teams
end

get "/teams/:team_name" do
  @name = params[:team_name].to_sym
  @roster = TeamData::ROLL_CALL[@name]
  erb :teamlist
end

get "/positions" do
  @example_team = TeamData::ROLL_CALL[:"Simpson Slammers"]
  @positions = @example_team.keys
  erb :positions
end

get "/positions/:position_name" do
  @this_position = params[:position_name]
  @position_name = params[:position_name].to_sym

  @players = []
  TeamData::ROLL_CALL.each do |team_name, team_data|
    player = [team_data[@position_name], team_name]
    @players << player
  end

  erb :positionlist
end
