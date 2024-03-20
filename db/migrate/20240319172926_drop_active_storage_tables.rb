class DropActiveStorageTables < ActiveRecord::Migration[7.1]
  def change
    def change
      drop_table :active_storage_blobs
      drop_table :active_storage_attachments
      drop_table :active_storage_variant_records
    end
  end
end
