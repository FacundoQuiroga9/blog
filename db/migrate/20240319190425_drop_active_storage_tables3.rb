class DropActiveStorageTables3 < ActiveRecord::Migration[7.1]
  def change
    drop_table :active_storage_attachments
    drop_table :active_storage_blobs, force: :cascade
    drop_table :active_storage_variant_records
  end
end
