class UpdatePortraitToProfileImageInActiveStorage < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE active_storage_attachments
      SET name = 'profile_image'
      WHERE name = 'portrait' AND record_type = 'User'
    SQL
  end

  def down
    execute <<-SQL
      UPDATE active_storage_attachments
      SET name = 'portrait'
      WHERE name = 'profile_image' AND record_type = 'User'
    SQL
  end
end
