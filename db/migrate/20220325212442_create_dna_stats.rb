class CreateDnaStats < ActiveRecord::Migration[5.2]
  def change
    create_table :dna_stats do |t|
      t.integer :count_mutant_dna
      t.integer :count_human_dna
      t.decimal :ratio

      t.timestamps
    end
  end
end
