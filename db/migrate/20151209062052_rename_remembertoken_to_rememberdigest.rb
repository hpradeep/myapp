class RenameRemembertokenToRememberdigest < ActiveRecord::Migration
  def change
  	rename_column  :members,:remember_token,:remember_digest
  end
end
