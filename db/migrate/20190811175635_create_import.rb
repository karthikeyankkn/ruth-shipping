class CreateImport < ActiveRecord::Migration[5.2]
  def change
    create_table :imports do |t|
		 t.bigint :job_no
		 t.string :imp
		 t.string :supplier_name
		 t.string :cargo_name
		 t.string :port_of_loading
		 t.string :line
		 t.string :bl_no
		 t.string	:status
		 t.string :_20_inch
		 t.string	:_40_inch
		 t.string :vsl_name
		 t.string :free_days
		 t.bigint :lot_no
		 t.bigint :shifting
		 t.bigint :weight
		 t.datetime :arrived
		 t.datetime :dem_upto

		 t.timestamps
    end
  end
end
