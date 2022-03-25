# == Schema Information
#
# Table name: dna_analizers
#
#  id         :bigint           not null, primary key
#  dna        :text             default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe DnaAnalizer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
