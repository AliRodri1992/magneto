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
  include SequenceAnalyzer

  validates :dna, presence: true
  validate :is_array?
  validate :nitrogen_base?
  validate :minimum_size

  after_save :mutant?

  def is_array?
    !!JSON.parse(dna)
  rescue JSON::ParserError
    errors.add(:dna, "isn't a array")
  end

  def mutant?
    update_column(:is_mutant, search_sequence(dna))
  end

  def nitrogen_base?
    dna_array = JSON.parse(dna)
    dna_array.each do |nitrogen_base|
      errors.add(:dna, "isn't a valid nitrogen base") unless nitrogen_base.match(/^[GCTA]+$/)
    end
  rescue JSON::ParserError
    errors.add(:dna, "isn't a valid nitrogen base")
  end

  def minimum_size
    dna_array = JSON.parse(dna)
    puts "SIZE:"
    puts "SIZE: #{dna_array.size}"
    if dna_array.size < 4
      errors.add(:dna, 'does not have the minimum size')
    else
      puts "CUMPLE EL REQUISITO"
    end
  rescue JSON::ParserError
    errors.add(:dna, 'does not have the minimum size')
  end
end
