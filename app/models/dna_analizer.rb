# == Schema Information
#
# Table name: dna_analizers
#
#  id         :bigint           not null, primary key
#  dna        :string
#  is_mutant  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DnaAnalizer < ApplicationRecord
  validates :dna, presence: true
  validate :is_array?
  validate :nitrogen_base?

  after_save :mutant?

  def is_array?
    !!JSON.parse(dna)
  rescue JSON::ParserError
    errors.add(:dna, "isn't a array")
  end

  def mutant?; end

  def nitrogen_base?
    dna_array = JSON.parse(dna)
    dna_array.each do |nitrogen_base|
      errors.add(:dna, "isn't a valid nitrogen base") unless nitrogen_base.match(/^[GCTA]+$/)
    end
  rescue JSON::ParserError
    errors.add(:dna, "isn't a valid nitrogen base")
  end
end
