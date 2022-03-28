# == Schema Information
#
# Table name: dna_analizers
#
#  id              :bigint           not null, primary key
#  DNA             :string
#  is_mutant       :bolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :dna_analizer do
    dna { "['AGGA','AACT','ACAT','AAAA']" }
    is_mutant { true }
  end
end
