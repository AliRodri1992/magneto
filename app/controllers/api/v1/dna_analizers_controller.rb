class Api::V1::DnaAnalizersController < ApplicationController
  def mutant
    dna_analizer = DnaAnalizer.new(dna: Array(params[:dna]))
    if dna_analizer.save
      render json: dna_analizer, status: :ok, code: '200'
    else
      render json: dna_analizer.errors, status: :unprocessable_entity, code: '422'
    end
  end
end
