class AddTelecallerTeamLeadToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :tele_caller_team_lead, :boolean, default: false
  end
end
