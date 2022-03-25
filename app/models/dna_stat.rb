# == Schema Information
#
# Table name: dna_stats
#
#  id               :bigint           not null, primary key
#  count_human_dna  :integer
#  count_mutant_dna :integer
#  ratio            :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class DnaStat < ApplicationRecord
end
