class DropActiveStorageTables2 < ActiveRecord::Migration[7.1]
  def change
    drop_table :active_storage_blobs, if_exists: true, force: :cascade
    drop_table :active_storage_variant_records, if_exists: true
    drop_table :active_storage_attachments, if_exists: true

  end

end
