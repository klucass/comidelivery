class CreateCupons < ActiveRecord::Migration
  def change
    create_table :cupons do |t|
    	t.string :identificador
    	t.integer :tipo
    	t.integer :valor
    	t.timestamps
    end
  end
end
