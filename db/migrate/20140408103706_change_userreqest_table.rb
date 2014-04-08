class ChangeUserreqestTable < ActiveRecord::Migration
  def change
  	change_column :userrequests,:RequestFrom, 'integer USING CAST("UserID" AS integer)'
  	change_column :userrequests,:RequestTo, 'integer USING CAST("UserID" AS integer)'
  end
end
