# == Schema Information
#
# Table name: dna_analizers
#
#  id         :bigint           not null, primary key
#  dna        :text             is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DnaAnalizer < ApplicationRecord
  validate :is_empty?

  def is_empty?
    errors.add(:dna, "can't be blank") if dna.size.zero?
  end
end
