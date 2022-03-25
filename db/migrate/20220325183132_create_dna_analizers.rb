class CreateDnaAnalizers < ActiveRecord::Migration[5.2]
  def change
    create_table :dna_analizers do |t|
      t.text :dna, array: true, default: []
      t.timestamps
    end
  end
end
