class Api::V1::DnaAnalizersController < ApplicationController
  def mutant
    puts 'ESTO ES UNA SOLICITUD'
    dna_analizer = DnaAnalizer.new(dna_analizer_params)
  end

  private

  def dna_analizer_params
    params.require(:dna_analizer).permit(:dna)
  end
end
