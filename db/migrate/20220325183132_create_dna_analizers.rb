class CreateDnaAnalizers < ActiveRecord::Migration[5.2]
  def change
    create_table :dna_analizers do |t|
      t.string :dna
      t.boolean :is_mutant
      t.timestamps
    end
  end
end
