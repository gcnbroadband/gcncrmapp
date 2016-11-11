class ChangeTeamLead < ActiveRecord::Migration
  def change
  	rename_column :users, :team_lead, :marketing_team_lead
  end
end
