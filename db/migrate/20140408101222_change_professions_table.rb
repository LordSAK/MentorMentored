class ChangeProfessionsTable < ActiveRecord::Migration
  def change
  	change_column :professions,:UserID, :integer
  	change_column :educations,:UserID,:integer
  end
end
