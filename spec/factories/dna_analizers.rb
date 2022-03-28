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
FactoryBot.define do
  factory :dna_analizer do
    dna { '["AAAAC","TTTAC","ATCAC","CCGAC","TTCAG"]' }
  end
end
