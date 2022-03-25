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

  def is_array?
    !!JSON.parse(dna)
  rescue JSON::ParserError
    errors.add(:dna, "isn't a array")
  end
end
