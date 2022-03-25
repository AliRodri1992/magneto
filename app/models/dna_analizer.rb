# == Schema Information
#
# Table name: dna_analizers
#
#  id         :bigint           not null, primary key
#  dna        :text             default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DnaAnalizer < ApplicationRecord
  validates :dna, presence: true
  validate :array?

  def array?
    errors.add(:dna, :invalid) unless dna.is_a?(Array)
  end
end
