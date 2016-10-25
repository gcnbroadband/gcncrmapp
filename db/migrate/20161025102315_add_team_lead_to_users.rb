class AddTeamLeadToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :team_lead, :boolean, default: false
  end
end
