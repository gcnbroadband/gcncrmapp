class AddTechnicalTeamLeadToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :technical_team_lead, :boolean, default: false
  end
end
